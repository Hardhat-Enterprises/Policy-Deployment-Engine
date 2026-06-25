#!/usr/bin/env python3
"""
linter — validates the ``docs/``, ``inputs/`` and ``policies/`` trees against
each other (structure + cross-reconciliation), with content checks on by default.

DOCS tree (``--tree docs``)
===========================
Structure rules
---------------
1a. ``docs/`` contains ONLY the allowed platform folders (``ALLOWED_PLATFORMS``);
    any other folder, and any file not in ``ALLOWED_ROOT_FILES``, is disallowed.
1b. Placeholder platforms (``aws``, ``azure``) contain exactly one entry: ``.gitkeep``.
1c. ``gcp/`` contains only directories (one per service). Each service directory
    contains only ``*.json`` files — no subdirectories, no other file types.
1d. Each GCP doc JSON validates against the schema below.

GCP doc JSON schema
-------------------
- Exactly three top-level keys, in order: ``last_updated``, ``provider_version``,
  ``arguments``.
- ``last_updated``: string, ISO-8601 UTC ``YYYY-MM-DDTHH:MM:SSZ``.
- ``provider_version``: string, ``x.y.z``.
- ``arguments``: object. Each value is either a block or a leaf:
    * block: exactly {description:str, required:bool, type:"block"}.
    * leaf:  exactly {description:str, required:bool, type:<type>,
             security_impact: bool|"true/false", rationale:str}.
- ``type`` is ``block``, a scalar (``string``/``bool``/``number``/``int``/``float``),
  or a collection ``list(scalar)`` / ``set(scalar)`` / ``map(scalar)``.

INPUTS tree (``--tree inputs``)
===============================
The ``inputs/`` taxonomy must reconcile *exactly* to the docs taxonomy:

2a. ``inputs/`` contains ONLY the allowed platform folders; no files.
2b. Placeholder platforms (``aws``, ``azure``) contain exactly one entry: ``.gitkeep``.
2c. ``inputs/gcp/`` holds only directories; each service-dir name must match a
    ``docs/gcp/<service>`` directory name exactly.
2d. Each service-dir holds only directories (resource types); each name must match a
    documented resource for that service (a ``docs/gcp/<service>/<resource>.json``).
2e. Each resource-dir holds only directories (arguments); each name must match a
    *non-block* argument key in that resource's doc JSON (``arguments`` map).
2f. Each argument-dir must contain the required files ``compliant.tf``,
    ``config.tf``, ``nonCompliant.tf``. Terraform-generated artifacts
    (``INPUT_ALLOWED_TF_FILES`` / ``INPUT_ALLOWED_TF_DIRS``) are tolerated;
    anything else is flagged for removal.

POLICIES tree (``--tree policies``)
===================================
The ``policies/`` taxonomy mirrors the inputs/docs taxonomy, but each argument is a
single ``*.rego`` policy file (not a directory):

3a. ``policies/`` contains ONLY the ``_helpers`` directory and the allowed platform
    folders; no other files or folders.
3b. ``_helpers/`` contains only directories, ``*.rego`` files and ``*.md`` files
    (recursively) — nothing else.
3c. Placeholder platforms (``aws``, ``azure``) contain exactly one entry: ``.gitkeep``.
3d. ``policies/gcp/`` holds only directories; each service-dir name must match a
    ``docs/gcp/<service>`` directory name exactly.
3e. Each service-dir holds only directories (resource types); each name must match a
    documented resource for that service (a ``docs/gcp/<service>/<resource>.json``).
3f. Each resource-dir holds only files: an optional ``_vars.rego`` plus one
    ``<argument>.rego`` per policy, where ``<argument>`` (the filename minus the
    ``.rego`` suffix) is a *non-block* argument key in that resource's doc JSON.
    Directories (the old ``<argument>/policy.rego`` layout) are flagged for flattening.

Run from the repo root (the folder containing ``docs/`` and ``inputs/``):
    uv run python scripts/linters/linter.py                 # lint every tree
    uv run python scripts/linters/linter.py --tree docs
    uv run python scripts/linters/linter.py --tree inputs --platform gcp
    uv run python scripts/linters/linter.py --tree policies
Exit code is 1 when any error is found, else 0.
"""

import argparse
import json
import os
import re
import sys
from datetime import datetime

# --------------------------------------------------------------------------- #
# Editable allow-lists — extend these as the docs tree grows.
# --------------------------------------------------------------------------- #
ALLOWED_PLATFORMS = {"gcp", "aws", "azure"}        # only these dirs allowed at docs/ root
ALLOWED_ROOT_FILES = {"ASSESSMENT_GUIDANCE.md"}    # non-platform files allowed at docs/ root
PLACEHOLDER_PLATFORMS = {"aws", "azure"}           # must hold only .gitkeep (structure TBD)
IGNORE_FILES = {".DS_Store", "Thumbs.db", "desktop.ini"}  # OS junk, ignored everywhere
INPUTS_AUX_DIRS = {"plan_cache"}                   # non-taxonomy dirs allowed under inputs/
                                                   # (committed terraform-plan JSON cache,
                                                   #  see scripts/auto_test/auto_test.py)

# --------------------------------------------------------------------------- #
# Inputs-tree allow-lists (argument-dir leaf files). Edit as the pipeline grows.
# --------------------------------------------------------------------------- #
INPUT_REQUIRED_FILES = {"compliant.tf", "config.tf", "nonCompliant.tf"}  # must exist in every arg dir
INPUT_ALLOWED_TF_FILES = {                                # terraform-generated, tolerated
    ".terraform.lock.hcl",
    "plan", "plan.json", "tfplan", "tfplan.json", "tfplan_flat.json",
    "terraform.tfstate", "terraform.tfstate.backup",
    "crash.log",
}
INPUT_ALLOWED_TF_DIRS = {".terraform"}                    # the only directory tolerated in an arg dir

# --------------------------------------------------------------------------- #
# Policies-tree allow-lists.
# --------------------------------------------------------------------------- #
POLICIES_HELPERS_DIR = "_helpers"                         # shared rego helpers, exempt from taxonomy
POLICIES_HELPER_EXTS = {".rego", ".md"}                   # only these file types live under _helpers
POLICY_VARS_FILE = "_vars.rego"                          # per-resource shared variables (optional);
                                                         # underscore-prefixed so it is never mistaken
                                                         # for an <argument>.rego policy file
POLICY_REGO_EXT = ".rego"

# --------------------------------------------------------------------------- #
# GCP doc JSON schema constants (learned from the existing docs).
# --------------------------------------------------------------------------- #
TOPLEVEL_KEYS = ["last_updated", "provider_version", "arguments"]
LEAF_KEYS = {"description", "required", "type", "security_impact", "rationale"}
BLOCK_KEYS = {"description", "required", "type"}
SCALAR_TYPES = {"string", "bool", "number", "int", "float"}
VALID_SECURITY_IMPACT_STR = "true/false"

DATE_RE = re.compile(r"^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}Z$")
VERSION_RE = re.compile(r"^\d+\.\d+\.\d+$")
COLLECTION_RE = re.compile(r"^(?:list|set|map)\((string|bool|number|int|float)\)$")


class ErrorLogger:
    def __init__(self):
        self.errors = []

    def log(self, message):
        self.errors.append(message)
        print(f"[ERROR] {message}")

    def summary(self):
        n = len(self.errors)
        print("[OK] No errors found." if n == 0 else f"\n[FAIL] {n} error(s) found.")
        return n


def is_valid_type(t):
    """True if ``t`` is a recognised argument type string."""
    if not isinstance(t, str):
        return False
    return t == "block" or t in SCALAR_TYPES or bool(COLLECTION_RE.match(t))


def is_valid_date(v):
    if not isinstance(v, str) or not DATE_RE.match(v):
        return False
    try:
        datetime.strptime(v, "%Y-%m-%dT%H:%M:%SZ")
        return True
    except ValueError:
        return False


class DocsValidator:
    def __init__(self, docs_root, logger):
        self.docs_root = docs_root
        self.logger = logger

    def _entries(self, path):
        """Directory entries minus ignored OS junk."""
        try:
            return [e for e in sorted(os.listdir(path)) if e not in IGNORE_FILES]
        except FileNotFoundError:
            self.logger.log(f"Folder not found: {path}")
            return []

    # ----- 1a: docs/ root ------------------------------------------------- #
    def validate_root(self, only_platform=None):
        for entry in self._entries(self.docs_root):
            full = os.path.join(self.docs_root, entry)
            if os.path.isdir(full):
                if entry not in ALLOWED_PLATFORMS:
                    self.logger.log(f"docs/: disallowed folder '{entry}' "
                                    f"(allowed platforms: {sorted(ALLOWED_PLATFORMS)})")
            else:
                if entry not in ALLOWED_ROOT_FILES:
                    self.logger.log(f"docs/: disallowed file '{entry}' "
                                    f"(allowed root files: {sorted(ALLOWED_ROOT_FILES) or 'none'})")

        for platform in sorted(ALLOWED_PLATFORMS):
            if only_platform and platform != only_platform:
                continue
            full = os.path.join(self.docs_root, platform)
            if not os.path.isdir(full):
                continue  # platform dir is optional (may not exist yet)
            if platform == "gcp":
                self.validate_gcp(full)
            elif platform in PLACEHOLDER_PLATFORMS:
                self.validate_placeholder(platform, full)

    # ----- 1b: aws / azure placeholders ----------------------------------- #
    def validate_placeholder(self, platform, path):
        entries = self._entries(path)
        if entries != [".gitkeep"]:
            self.logger.log(f"docs/{platform}/: must contain only '.gitkeep' "
                            f"(found: {entries or 'empty'})")

    # ----- 1c: gcp structure ---------------------------------------------- #
    def validate_gcp(self, gcp_root):
        for entry in self._entries(gcp_root):
            full = os.path.join(gcp_root, entry)
            if os.path.isfile(full):
                self.logger.log(f"docs/gcp/: unexpected file '{entry}' (gcp holds service dirs only)")
            elif os.path.isdir(full):
                self.validate_gcp_service(entry, full)

    def validate_gcp_service(self, service, service_path):
        for entry in self._entries(service_path):
            full = os.path.join(service_path, entry)
            rel = f"docs/gcp/{service}/{entry}"
            if os.path.isdir(full):
                self.logger.log(f"{rel}: unexpected subdirectory (service dirs hold only .json files)")
            elif not entry.endswith(".json"):
                self.logger.log(f"{rel}: unexpected non-JSON file (only .json allowed)")
            else:
                self.validate_json_file(full, rel)

    # ----- 1d: gcp doc JSON schema ---------------------------------------- #
    def validate_json_file(self, path, rel):
        try:
            with open(path, encoding="utf-8") as f:
                doc = json.load(f)
        except (json.JSONDecodeError, OSError) as e:
            self.logger.log(f"{rel}: not valid JSON ({e})")
            return

        if not isinstance(doc, dict):
            self.logger.log(f"{rel}: top level must be an object")
            return

        keys = list(doc.keys())
        if keys != TOPLEVEL_KEYS:
            self.logger.log(f"{rel}: top-level keys must be {TOPLEVEL_KEYS} in order (found {keys})")
            # keep going where possible

        if not is_valid_date(doc.get("last_updated")):
            self.logger.log(f"{rel}: 'last_updated' must be 'YYYY-MM-DDTHH:MM:SSZ' "
                            f"(found {doc.get('last_updated')!r})")

        pv = doc.get("provider_version")
        if not isinstance(pv, str) or not VERSION_RE.match(pv):
            self.logger.log(f"{rel}: 'provider_version' must match x.y.z (found {pv!r})")

        args = doc.get("arguments")
        if not isinstance(args, dict):
            self.logger.log(f"{rel}: 'arguments' must be an object (found {type(args).__name__})")
            return

        for name, entry in args.items():
            self.validate_argument(rel, name, entry)

    def validate_argument(self, rel, name, entry):
        where = f"{rel}: argument '{name}'"
        if not isinstance(entry, dict):
            self.logger.log(f"{where}: must be an object")
            return

        t = entry.get("type")
        if not is_valid_type(t):
            self.logger.log(f"{where}: invalid type {t!r}")

        is_block = (t == "block")
        expected = BLOCK_KEYS if is_block else LEAF_KEYS
        actual = set(entry.keys())
        if actual != expected:
            missing = expected - actual
            extra = actual - expected
            detail = []
            if missing:
                detail.append(f"missing {sorted(missing)}")
            if extra:
                detail.append(f"unexpected {sorted(extra)}")
            self.logger.log(f"{where}: {'block' if is_block else 'leaf'} keys wrong ({'; '.join(detail)})")

        # field-type checks (only for fields that are present)
        if "description" in entry and not isinstance(entry["description"], str):
            self.logger.log(f"{where}: 'description' must be a string")
        if "required" in entry and not isinstance(entry["required"], bool):
            self.logger.log(f"{where}: 'required' must be a boolean")

        if not is_block:
            si = entry.get("security_impact")
            if not (isinstance(si, bool) or si == VALID_SECURITY_IMPACT_STR):
                self.logger.log(f"{where}: 'security_impact' must be a bool or "
                                f"the string {VALID_SECURITY_IMPACT_STR!r} (found {si!r})")
            if "rationale" in entry and not isinstance(entry["rationale"], str):
                self.logger.log(f"{where}: 'rationale' must be a string")


def build_gcp_docs_index(docs_root):
    """Return ``{service: {resource: {arg_key: type}}}`` for ``docs/gcp/``.

    Used by the inputs validator to reconcile the inputs taxonomy against docs.
    Malformed JSON is skipped (the docs validator reports it separately).
    """
    index = {}
    gcp_root = os.path.join(docs_root, "gcp")
    if not os.path.isdir(gcp_root):
        return index
    for service in sorted(os.listdir(gcp_root)):
        svc_path = os.path.join(gcp_root, service)
        if not os.path.isdir(svc_path):
            continue
        resources = {}
        for entry in sorted(os.listdir(svc_path)):
            if not entry.endswith(".json"):
                continue
            try:
                with open(os.path.join(svc_path, entry), encoding="utf-8") as f:
                    doc = json.load(f)
                args = doc.get("arguments", {})
                resources[entry[:-5]] = {
                    k: v.get("type") for k, v in args.items() if isinstance(v, dict)
                }
            except (json.JSONDecodeError, OSError):
                continue
        index[service] = resources
    return index


class InputsValidator:
    """Validate the ``inputs/`` tree, reconciling its taxonomy to ``docs/gcp``."""

    def __init__(self, inputs_root, docs_index, logger):
        self.root = inputs_root
        self.docs = docs_index  # {service: {resource: {arg: type}}}
        self.logger = logger

    def _entries(self, path):
        try:
            return [e for e in sorted(os.listdir(path)) if e not in IGNORE_FILES]
        except FileNotFoundError:
            self.logger.log(f"Folder not found: {path}")
            return []

    def _dirs_only(self, path, rel):
        """Return subdir names; flag any plain file (these levels hold only dirs)."""
        dirs = []
        for entry in self._entries(path):
            if os.path.isdir(os.path.join(path, entry)):
                dirs.append(entry)
            else:
                self.logger.log(f"{rel}: unexpected file '{entry}' (only directories allowed here)")
        return dirs

    # ----- 2a: inputs/ root ----------------------------------------------- #
    def validate_root(self, only_platform=None):
        for entry in self._entries(self.root):
            full = os.path.join(self.root, entry)
            if os.path.isdir(full):
                if entry in INPUTS_AUX_DIRS:
                    continue  # plan_cache etc. — not part of the taxonomy
                if entry not in ALLOWED_PLATFORMS:
                    self.logger.log(f"inputs/: disallowed folder '{entry}' "
                                    f"(allowed platforms: {sorted(ALLOWED_PLATFORMS)})")
            else:
                self.logger.log(f"inputs/: disallowed file '{entry}' (inputs/ holds platform dirs only)")

        for platform in sorted(ALLOWED_PLATFORMS):
            if only_platform and platform != only_platform:
                continue
            full = os.path.join(self.root, platform)
            if not os.path.isdir(full):
                continue  # platform dir is optional (may not exist yet)
            if platform == "gcp":
                self.validate_gcp(full)
            elif platform in PLACEHOLDER_PLATFORMS:
                self.validate_placeholder(platform, full)

    # ----- 2b: aws / azure placeholders ----------------------------------- #
    def validate_placeholder(self, platform, path):
        entries = self._entries(path)
        if entries != [".gitkeep"]:
            self.logger.log(f"inputs/{platform}/: must contain only '.gitkeep' "
                            f"(found: {entries or 'empty'})")

    # ----- 2c: inputs/gcp services ---------------------------------------- #
    def validate_gcp(self, gcp_root):
        for service in self._dirs_only(gcp_root, "inputs/gcp"):
            rel = f"inputs/gcp/{service}"
            docres = self.docs.get(service)  # None => service name doesn't match docs
            if docres is None:
                self.logger.log(f"{rel}: service does not match any docs/gcp service")
            self.validate_service(os.path.join(gcp_root, service), rel, docres)

    # ----- 2d: resource types --------------------------------------------- #
    def validate_service(self, service_path, rel, docres):
        for resource in self._dirs_only(service_path, rel):
            res_rel = f"{rel}/{resource}"
            # docargs: {arg: type} when the resource matches docs, else None
            if docres is None:
                docargs = None
            elif resource not in docres:
                self.logger.log(f"{res_rel}: resource type not documented for this service")
                docargs = None
            else:
                docargs = docres[resource]
            self.validate_resource(os.path.join(service_path, resource), res_rel, docargs)

    # ----- 2e: argument keys ---------------------------------------------- #
    def validate_resource(self, resource_path, rel, docargs):
        for arg in self._dirs_only(resource_path, rel):
            arg_rel = f"{rel}/{arg}"
            if docargs is not None:
                if arg not in docargs:
                    self.logger.log(f"{arg_rel}: not a documented argument key for this resource")
                elif docargs[arg] == "block":
                    self.logger.log(f"{arg_rel}: argument key is a block (only non-block keys allowed)")
            self.validate_argument_dir(os.path.join(resource_path, arg), arg_rel)

    # ----- 2f: argument-dir leaf files ------------------------------------ #
    def validate_argument_dir(self, arg_path, rel):
        entries = self._entries(arg_path)
        present = set(entries)
        missing = INPUT_REQUIRED_FILES - present
        if missing:
            self.logger.log(f"{rel}: missing required file(s) {sorted(missing)}")

        for entry in entries:
            if entry in INPUT_REQUIRED_FILES:
                continue
            if os.path.isdir(os.path.join(arg_path, entry)):
                if entry not in INPUT_ALLOWED_TF_DIRS:
                    self.logger.log(f"{rel}/{entry}: directories not allowed in an argument dir")
            elif entry not in INPUT_ALLOWED_TF_FILES:
                self.logger.log(f"{rel}/{entry}: unexpected file "
                                f"(not required and not a terraform artifact — should be removed)")


class PoliciesValidator:
    """Validate the ``policies/`` tree, reconciling its taxonomy to ``docs/gcp``."""

    def __init__(self, policies_root, docs_index, logger):
        self.root = policies_root
        self.docs = docs_index  # {service: {resource: {arg: type}}}
        self.logger = logger

    def _entries(self, path):
        try:
            return [e for e in sorted(os.listdir(path)) if e not in IGNORE_FILES]
        except FileNotFoundError:
            self.logger.log(f"Folder not found: {path}")
            return []

    def _dirs_only(self, path, rel):
        """Return subdir names; flag any plain file (these levels hold only dirs)."""
        dirs = []
        for entry in self._entries(path):
            if os.path.isdir(os.path.join(path, entry)):
                dirs.append(entry)
            else:
                self.logger.log(f"{rel}: unexpected file '{entry}' (only directories allowed here)")
        return dirs

    # ----- 3a: policies/ root --------------------------------------------- #
    def validate_root(self, only_platform=None):
        for entry in self._entries(self.root):
            full = os.path.join(self.root, entry)
            if not os.path.isdir(full):
                self.logger.log(f"policies/: disallowed file '{entry}' "
                                f"(policies/ holds '{POLICIES_HELPERS_DIR}' and platform dirs only)")
            elif entry == POLICIES_HELPERS_DIR:
                continue  # validated below
            elif entry not in ALLOWED_PLATFORMS:
                self.logger.log(f"policies/: disallowed folder '{entry}' "
                                f"(allowed: '{POLICIES_HELPERS_DIR}', {sorted(ALLOWED_PLATFORMS)})")

        helpers = os.path.join(self.root, POLICIES_HELPERS_DIR)
        if os.path.isdir(helpers) and not only_platform:
            self.validate_helpers(helpers, f"policies/{POLICIES_HELPERS_DIR}")

        for platform in sorted(ALLOWED_PLATFORMS):
            if only_platform and platform != only_platform:
                continue
            full = os.path.join(self.root, platform)
            if not os.path.isdir(full):
                continue  # platform dir is optional (may not exist yet)
            if platform == "gcp":
                self.validate_gcp(full)
            elif platform in PLACEHOLDER_PLATFORMS:
                self.validate_placeholder(platform, full)

    # ----- 3b: _helpers --------------------------------------------------- #
    def validate_helpers(self, path, rel):
        """Only directories, *.rego and *.md files are allowed (recursively)."""
        for entry in self._entries(path):
            full = os.path.join(path, entry)
            if os.path.isdir(full):
                self.validate_helpers(full, f"{rel}/{entry}")
            elif os.path.splitext(entry)[1] not in POLICIES_HELPER_EXTS:
                self.logger.log(f"{rel}/{entry}: unexpected file "
                                f"(only {sorted(POLICIES_HELPER_EXTS)} allowed under {POLICIES_HELPERS_DIR})")

    # ----- 3c: aws / azure placeholders ----------------------------------- #
    def validate_placeholder(self, platform, path):
        entries = self._entries(path)
        if entries != [".gitkeep"]:
            self.logger.log(f"policies/{platform}/: must contain only '.gitkeep' "
                            f"(found: {entries or 'empty'})")

    # ----- 3d: policies/gcp services -------------------------------------- #
    def validate_gcp(self, gcp_root):
        for service in self._dirs_only(gcp_root, "policies/gcp"):
            rel = f"policies/gcp/{service}"
            docres = self.docs.get(service)  # None => service name doesn't match docs
            if docres is None:
                self.logger.log(f"{rel}: service does not match any docs/gcp service")
            self.validate_service(os.path.join(gcp_root, service), rel, docres)

    # ----- 3e: resource types --------------------------------------------- #
    def validate_service(self, service_path, rel, docres):
        for resource in self._dirs_only(service_path, rel):
            res_rel = f"{rel}/{resource}"
            if docres is None:
                docargs = None
            elif resource not in docres:
                self.logger.log(f"{res_rel}: resource type not documented for this service")
                docargs = None
            else:
                docargs = docres[resource]
            self.validate_resource(os.path.join(service_path, resource), res_rel, docargs)

    # ----- 3f: per-argument rego files ------------------------------------ #
    def validate_resource(self, resource_path, rel, docargs):
        for entry in self._entries(resource_path):
            entry_rel = f"{rel}/{entry}"
            full = os.path.join(resource_path, entry)
            if os.path.isdir(full):
                self.logger.log(f"{entry_rel}: directories not allowed in a resource dir "
                                f"(flatten its policy.rego into '{entry}{POLICY_REGO_EXT}')")
                continue
            if entry == POLICY_VARS_FILE:
                continue
            if not entry.endswith(POLICY_REGO_EXT):
                self.logger.log(f"{entry_rel}: unexpected file "
                                f"(only '{POLICY_VARS_FILE}' and '<argument>{POLICY_REGO_EXT}' allowed)")
                continue
            arg = entry[: -len(POLICY_REGO_EXT)]
            if docargs is not None:
                if arg not in docargs:
                    self.logger.log(f"{entry_rel}: '{arg}' is not a documented argument key for this resource")
                elif docargs[arg] == "block":
                    self.logger.log(f"{entry_rel}: '{arg}' is a block argument (only non-block keys allowed)")


# =========================================================================== #
# CONTENT CHECKS (on by default; `--no-content-checks` to skip)
# --------------------------------------------------------------------------- #
# Everything ABOVE this banner is the structural/taxonomy linter; it never opens
# a .tf or .rego file. The checks BELOW read *inside* files. They run by default
# (the fixture backlog is cleared — the whole tree passes); pass
# `--no-content-checks` for structural validation only. Rules:
#   A. policies: each .rego `package` matches its path —
#      terraform.gcp.security.<service>.<resource>.<seg>  (seg = filename stem
#      with '.'->'_'; _vars.rego -> .<resource>.vars). The <service> segment is
#      not asserted (the on-disk service dir name differs from the slug).
#   B. inputs: a fixture (compliant.tf / nonCompliant.tf) contains ONLY the
#      tested resource type (== its dir); dependency resources are disallowed
#      (we run `tf plan` only, so the tested resource uses fake values instead).
#   C. inputs: tested-resource labels follow the example convention,
#      compliant_example_N (compliant.tf) / non_compliant_example_N
#      (nonCompliant.tf), sequential from 1, always suffixed.
# Deliberately NOT carried over from the legacy linter: `terraform fmt`
# (mutates files) and the lowercase-filename regex (breaks on dotted docs keys).
# =========================================================================== #

PKG_RE = re.compile(r"^\s*package\s+([A-Za-z0-9_.]+)")
TF_RESOURCE_RE = re.compile(r'^\s*resource\s+"([^"]+)"\s+"([^"]+)"')


class ContentChecksValidator:
    """Reads inside .rego/.tf files (opt-in; see banner).

    Name *reconciliation* is done by the structural validators above; this only
    checks that file *contents* line up with those (already-validated) names.
    """

    def __init__(self, policies_root, inputs_root, logger):
        self.policies_root = policies_root
        self.inputs_root = inputs_root
        self.logger = logger

    def validate(self, only_platform=None, do_inputs=True, do_policies=True):
        # Only gcp is populated today; aws/azure are .gitkeep placeholders.
        if only_platform and only_platform != "gcp":
            return
        if do_policies:
            self._check_policies_packages(os.path.join(self.policies_root, "gcp"))
        if do_inputs:
            self._check_inputs_terraform(os.path.join(self.inputs_root, "gcp"))

    @staticmethod
    def _read_package(path):
        try:
            with open(path, encoding="utf-8") as fh:
                for line in fh:
                    m = PKG_RE.match(line)
                    if m:
                        return m.group(1).strip()
        except OSError:
            return None
        return None

    # ----- A: rego package path (policies) -------------------------------- #
    def _check_policies_packages(self, gcp_root):
        """A: each .rego `package` must sit at its path.

        Expected: ``terraform.gcp.security.<service_seg>.<resource>.<seg>`` where
        ``<seg>`` is the filename stem with dots->underscores (folders may carry
        dotted docs keys; packages sanitise them). ``_vars.rego`` -> ``.<resource>.vars``.
        CAVEAT: ``<service_seg>`` is NOT validated — the on-disk service dir
        (e.g. "Data Catalog") differs from the package service segment (e.g.
        "google_data_catalog"), so only the prefix and the trailing
        ``.<resource>.<seg>`` are asserted.
        """
        if not os.path.isdir(gcp_root):
            return
        for service in sorted(os.listdir(gcp_root)):
            svc = os.path.join(gcp_root, service)
            if not os.path.isdir(svc):
                continue
            for resource in sorted(os.listdir(svc)):
                res = os.path.join(svc, resource)
                if not os.path.isdir(res):
                    continue
                for entry in sorted(os.listdir(res)):
                    if not entry.endswith(POLICY_REGO_EXT):
                        continue
                    rel = f"policies/gcp/{service}/{resource}/{entry}"
                    stem = entry[: -len(POLICY_REGO_EXT)]
                    seg = "vars" if entry == POLICY_VARS_FILE else stem.replace(".", "_")
                    pkg = self._read_package(os.path.join(res, entry))
                    if pkg is None:
                        self.logger.log(f"[content] {rel}: no `package` declaration found")
                        continue
                    if not pkg.startswith("terraform.gcp.security."):
                        self.logger.log(
                            f"[content] {rel}: package {pkg!r} must start with 'terraform.gcp.security.'")
                    expected_suffix = f".{resource}.{seg}"
                    if not pkg.endswith(expected_suffix):
                        self.logger.log(
                            f"[content] {rel}: package {pkg!r} must end with '{expected_suffix}'")

    # ----- B & C: single tested resource + example label convention ------- #
    FIXTURES = (("compliant.tf", "compliant_example"),
                ("nonCompliant.tf", "non_compliant_example"))

    def _check_inputs_terraform(self, gcp_root):
        """B & C: for each compliant.tf / nonCompliant.tf in an argument dir."""
        if not os.path.isdir(gcp_root):
            return
        for service in sorted(os.listdir(gcp_root)):
            svc = os.path.join(gcp_root, service)
            if not os.path.isdir(svc):
                continue
            for resource in sorted(os.listdir(svc)):
                res = os.path.join(svc, resource)
                if not os.path.isdir(res):
                    continue
                for arg in sorted(os.listdir(res)):
                    arg_path = os.path.join(res, arg)
                    if not os.path.isdir(arg_path):
                        continue
                    for tf_name, label_prefix in self.FIXTURES:
                        tf_path = os.path.join(arg_path, tf_name)
                        if os.path.isfile(tf_path):
                            rel = f"inputs/gcp/{service}/{resource}/{arg}/{tf_name}"
                            self._check_tf_file(tf_path, rel, resource, label_prefix)

    def _check_tf_file(self, tf_path, rel, expected_type, label_prefix):
        try:
            with open(tf_path, encoding="utf-8") as fh:
                lines = fh.read().splitlines()
        except OSError as e:
            self.logger.log(f"[content] {rel}: could not read ({e})")
            return
        blocks = []
        for line in lines:
            m = TF_RESOURCE_RE.match(line)
            if m:
                blocks.append((m.group(1), m.group(2)))
        if not blocks:
            self.logger.log(f"[content] {rel}: no resource block (expected one '{expected_type}')")
            return
        # B: only the tested resource type may appear — no dependency resources
        foreign = sorted({t for t, _ in blocks if t != expected_type})
        if foreign:
            self.logger.log(
                f"[content] {rel}: dependency resource(s) {foreign} not allowed; only "
                f"'{expected_type}' may appear (remove deps; use fake values)")
        # C: tested-resource labels must be <prefix>_N, sequential from 1
        for i, label in enumerate([l for t, l in blocks if t == expected_type], start=1):
            expected = f"{label_prefix}_{i}"
            if label != expected:
                self.logger.log(f"[content] {rel}: resource label {label!r} should be {expected!r}")


def main(argv=None):
    parser = argparse.ArgumentParser(
        description="Validate the docs/ and inputs/ trees (structure + cross-reconciliation).")
    parser.add_argument("--docs", default="docs", help="Path to the docs root (default: docs).")
    parser.add_argument("--inputs", default="inputs", help="Path to the inputs root (default: inputs).")
    parser.add_argument("--policies", default="policies", help="Path to the policies root (default: policies).")
    parser.add_argument("--tree", choices=["docs", "inputs", "policies", "all"], default="all",
                        help="Which tree(s) to validate (default: all).")
    parser.add_argument("--platform", choices=sorted(ALLOWED_PLATFORMS), default=None,
                        help="Limit validation to a single platform.")
    parser.add_argument("--content-checks", action=argparse.BooleanOptionalAction, default=True,
                        help="Run the content checks (rego package paths, single tested resource, "
                             "example label convention). On by default; use --no-content-checks "
                             "to skip and run structural validation only.")
    args = parser.parse_args(argv)

    docs_root = os.path.abspath(args.docs)
    inputs_root = os.path.abspath(args.inputs)
    policies_root = os.path.abspath(args.policies)
    logger = ErrorLogger()

    do_docs = args.tree in ("docs", "all")
    do_inputs = args.tree in ("inputs", "all")
    do_policies = args.tree in ("policies", "all")

    # The docs index reconciles both the inputs and policies trees; build it once
    # and share it (parsing every docs JSON is the linter's dominant I/O cost).
    docs_index = None
    if do_inputs or do_policies:
        if not os.path.isdir(docs_root):
            print(f"[ERROR] docs root not found: {docs_root} (needed to reconcile inputs/policies).")
            sys.exit(2)
        docs_index = build_gcp_docs_index(docs_root)

    if do_docs:
        if not os.path.isdir(docs_root):
            print(f"[ERROR] docs root not found: {docs_root} (run from the repo root or pass --docs).")
            sys.exit(2)
        print(f"\n[*] Linting docs tree at {docs_root}"
              f"{f' (platform: {args.platform})' if args.platform else ''}\n")
        DocsValidator(docs_root, logger).validate_root(only_platform=args.platform)

    if do_inputs:
        if not os.path.isdir(inputs_root):
            print(f"[ERROR] inputs root not found: {inputs_root} (run from the repo root or pass --inputs).")
            sys.exit(2)
        print(f"\n[*] Linting inputs tree at {inputs_root}"
              f"{f' (platform: {args.platform})' if args.platform else ''}\n")
        InputsValidator(inputs_root, docs_index, logger).validate_root(only_platform=args.platform)

    if do_policies:
        if not os.path.isdir(policies_root):
            print(f"[ERROR] policies root not found: {policies_root} (run from the repo root or pass --policies).")
            sys.exit(2)
        print(f"\n[*] Linting policies tree at {policies_root}"
              f"{f' (platform: {args.platform})' if args.platform else ''}\n")
        PoliciesValidator(policies_root, docs_index, logger).validate_root(only_platform=args.platform)

    if args.content_checks and (do_inputs or do_policies):
        print("\n[*] Running content checks\n")
        ContentChecksValidator(policies_root, inputs_root, logger).validate(
            only_platform=args.platform, do_inputs=do_inputs, do_policies=do_policies)

    if logger.summary():
        sys.exit(1)


if __name__ == "__main__":
    main()
