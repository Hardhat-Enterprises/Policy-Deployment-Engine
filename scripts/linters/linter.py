#!/usr/bin/env python3
"""
linter — validates the ``docs/`` and ``policies/`` trees against each other
(structure + cross-reconciliation), with content checks on by default.

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
1e. (content check) Cross-cutting arguments carry their canonical assessment. A
    top-level ``location``/``region``/``zone``, and the common keys on the split IAM
    resources, mean the same thing everywhere, so ``security_impact`` and
    ``rationale`` come from ``scripts/docgen/lib/canonical.py`` — including for the
    resources that module exempts, which are locked to a different answer rather than
    left free. A content check on purpose: see ``DocsCanonicalValidator``.

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

POLICIES tree (``--tree policies``)
===================================
The ``policies/`` taxonomy must reconcile *exactly* to the docs taxonomy. Each argument
is one self-contained directory holding its policy and both terraform fixtures:

3a. ``policies/`` contains ONLY the ``_helpers`` directory and the allowed platform
    folders; no other files or folders.
3b. ``_helpers/`` contains only directories, ``*.rego`` files and ``*.md`` files
    (recursively) — nothing else.
3c. Placeholder platforms (``aws``, ``azure``) contain exactly one entry: ``.gitkeep``.
3d. ``policies/gcp/`` holds service directories plus exactly one file, ``config.tf`` —
    the provider stub shared by every fixture on the platform. Each service-dir name
    must match a ``docs/gcp/<service>`` directory name exactly.
3e. Each service-dir holds only directories (resource types); each name must match a
    documented resource for that service (a ``docs/gcp/<service>/<resource>.json``).
3f. Each resource-dir holds an optional ``_vars.rego`` plus one DIRECTORY per argument,
    where the directory name is a *non-block* argument key in that resource's doc JSON.
3g. Each argument-dir contains exactly ``policy.rego``, ``compliant.tf`` and
    ``nonCompliant.tf`` — nothing else.

Run from the repo root (the folder containing ``docs/`` and ``policies/``):
    uv run python scripts/linters/linter.py                 # lint every tree
    uv run python scripts/linters/linter.py --tree docs
    uv run python scripts/linters/linter.py --tree policies --platform gcp
Exit code is 1 when any error is found, else 0.
"""

import argparse
import json
import os
import re
import subprocess
import sys
from datetime import datetime
from pathlib import Path
import subprocess
sys.path.insert(0, str(Path(__file__).resolve().parents[2]))
from scripts.auto_test.auto_test import PLAN_FILE_RE, alternate_fixture_shas, plan_cache_path
from scripts.docgen.lib.canonical import canonical_for


# --------------------------------------------------------------------------- #
# Editable allow-lists — extend these as the docs tree grows.
# --------------------------------------------------------------------------- #
ALLOWED_PLATFORMS = {"gcp", "aws", "azure"}        # only these dirs allowed at docs/ root
ALLOWED_ROOT_FILES = {"ASSESSMENT_GUIDANCE.md"}    # non-platform files allowed at docs/ root
PLACEHOLDER_PLATFORMS = {"aws", "azure"}           # must hold only .gitkeep (structure TBD)
IGNORE_FILES = {".DS_Store", "Thumbs.db", "desktop.ini"}  # OS junk, ignored everywhere


def ignored_under(root):
    """Paths under ``root`` that git ignores — untracked and excluded.

    One `git ls-files` for the whole tree, so the per-directory checks below are
    set lookups. A file that is *tracked* never appears here even if a later
    .gitignore rule would match it, which is the behaviour wanted: a binary
    `tfplan` that reached dev has to be reported, however well ignored it would be
    today.

    Returns None outside a git checkout (or with no git on PATH), and the callers
    then fall back to INPUT_ALLOWED_TF_FILES.
    """
    try:
        proc = subprocess.run(
            ["git", "ls-files", "--others", "--ignored", "--exclude-standard", "-z", "--", str(root)],
            capture_output=True, text=True)
    except (OSError, ValueError):
        return None
    if proc.returncode != 0:
        return None
    return {os.path.normpath(p) for p in proc.stdout.split("\0") if p}

# --------------------------------------------------------------------------- #
# Policies-tree allow-lists.
# --------------------------------------------------------------------------- #
POLICIES_HELPERS_DIR = "_helpers"                         # shared rego helpers, exempt from taxonomy
POLICIES_HELPER_EXTS = {".rego", ".md"}                   # only these file types live under _helpers
POLICY_VARS_FILE = "_vars.rego"                          # per-resource shared variables (optional);
                                                         # underscore-prefixed so it is never mistaken
                                                         # for an argument directory
POLICY_FILE = "policy.rego"                              # the policy itself, one per argument dir
PLATFORM_CONFIG_FILE = "config.tf"                       # ONE per platform at policies/<platform>/
POLICY_REGO_EXT = ".rego"
# Exactly these three, nothing else, in every argument dir. Terraform never runs in the
# tree any more (auto_test plans in a throwaway workspace), so there are no generated
# artefacts to tolerate here.
ARGUMENT_REQUIRED_FILES = {"compliant.tf", "nonCompliant.tf", POLICY_FILE}

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


class DocsCanonicalValidator:
    """Docs content check: canonical arguments carry their canonical assessment.

    Some arguments mean the same thing on every resource — a top-level
    ``location``/``region``/``zone``, and the common keys on the split IAM resources.
    Deciding those per resource produced 14 different answers to the same question,
    three of which were right for reasons the generic answer could not express (see
    ``canonical.EXEMPTIONS``) and eleven of which were the same sentence rewritten.

    A CONTENT check, not a structural one, and deliberately so. The structural pass is
    a hard tree-wide gate on every pull request; a rule that can be broken by editing
    any one of ~400 docs files does not belong there, or one contributor's drift turns
    every other contributor's pull request red. As a content check it reaches people
    the right way round: ``run_precommit_linter`` attributes it to whoever changed the
    file, and the whole-tree ALL run reports the rest.
    """

    def __init__(self, docs_root, logger):
        self.docs_root = docs_root
        self.logger = logger

    def validate(self, only_platform=None):
        for platform in sorted(ALLOWED_PLATFORMS):
            if only_platform and platform != only_platform:
                continue
            root = os.path.join(self.docs_root, platform)
            if not os.path.isdir(root):
                continue
            for service in sorted(os.listdir(root)):
                service_dir = os.path.join(root, service)
                if not os.path.isdir(service_dir):
                    continue
                for entry in sorted(os.listdir(service_dir)):
                    if entry.endswith(".json"):
                        self._check_file(os.path.join(service_dir, entry),
                                         f"docs/{platform}/{service}/{entry}",
                                         entry[:-len(".json")])

    def _check_file(self, path, rel, resource):
        try:
            with open(path, encoding="utf-8") as fh:
                doc = json.load(fh)
        except (OSError, json.JSONDecodeError):
            return                      # DocsValidator reports malformed files
        arguments = doc.get("arguments")
        if not isinstance(arguments, dict):
            return

        for key, entry in arguments.items():
            if not isinstance(entry, dict) or "security_impact" not in entry:
                continue                # blocks carry no assessment
            canon = canonical_for(resource, key)
            if canon is None:
                continue
            impact, rationale = canon
            for field, want in (("security_impact", impact), ("rationale", rationale)):
                got = entry.get(field)
                if got == want:
                    continue
                self.logger.log(
                    f"[content] {rel}: argument '{key}' has a canonical {field} that has "
                    f"been changed. Restore it with "
                    f"`python3 scripts/docgen/apply_canonical.py --apply`, or — if this "
                    f"resource genuinely differs — add it to EXEMPTIONS in "
                    f"scripts/docgen/lib/canonical.py with the reason "
                    f"(found {shorten(got)}, expected {shorten(want)})")


def shorten(value, limit=60):
    """A field value, trimmed to something that fits on a terminal line."""
    text = json.dumps(value) if not isinstance(value, str) else value
    return repr(text if len(text) <= limit else text[:limit] + "…")


def build_gcp_docs_index(docs_root):
    """Return ``{service: {resource: {arg_key: type}}}`` for ``docs/gcp/``.

    Used by the policies validator to reconcile the policies taxonomy against docs.
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


class PoliciesValidator:
    """Validate the ``policies/`` tree, reconciling its taxonomy to ``docs/gcp``.

    This is the only content tree: each argument is a self-contained directory holding
    its policy and both terraform fixtures. (There used to be a mirrored ``inputs/``
    tree validated separately; its rules live here now.)
    """

    def __init__(self, policies_root, docs_index, logger):
        self.root = policies_root
        self.docs = docs_index  # {service: {resource: {arg: type}}}
        self.logger = logger
        self.ignored = ignored_under(policies_root)

    def _entries(self, path):
        try:
            return [e for e in sorted(os.listdir(path)) if e not in IGNORE_FILES]
        except FileNotFoundError:
            self.logger.log(f"Folder not found: {path}")
            return []

    def _dirs_only(self, path, rel, allowed_files=()):
        """Return subdir names; flag any plain file not explicitly allowed here."""
        dirs = []
        for entry in self._entries(path):
            if os.path.isdir(os.path.join(path, entry)):
                dirs.append(entry)
            elif entry not in allowed_files:
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

    # ----- 3d: policies/gcp services + the one platform config.tf --------- #
    def validate_gcp(self, gcp_root):
        # Every fixture used to carry its own duplicate config.tf; there is now exactly
        # one per platform, here, copied into a throwaway workspace at plan time.
        if not os.path.isfile(os.path.join(gcp_root, PLATFORM_CONFIG_FILE)):
            self.logger.log(f"policies/gcp/: missing '{PLATFORM_CONFIG_FILE}' "
                            "(the shared provider stub every fixture is planned with)")
        for service in self._dirs_only(gcp_root, "policies/gcp",
                                       allowed_files=(PLATFORM_CONFIG_FILE,)):
            rel = f"policies/gcp/{service}"
            docres = self.docs.get(service)  # None: service name matches no docs service
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

    # ----- 3f: per-argument directories + the optional _vars.rego --------- #
    def validate_resource(self, resource_path, rel, docargs):
        for entry in self._entries(resource_path):
            entry_rel = f"{rel}/{entry}"
            full = os.path.join(resource_path, entry)
            if not os.path.isdir(full):
                if entry != POLICY_VARS_FILE:
                    self.logger.log(f"{entry_rel}: unexpected file (a resource dir holds "
                                    f"'{POLICY_VARS_FILE}' and one directory per argument)")
                continue
            if docargs is not None:
                if entry not in docargs:
                    self.logger.log(f"{entry_rel}: not a documented argument key for this resource")
                elif docargs[entry] == "block":
                    self.logger.log(f"{entry_rel}: argument key is a block (only non-block keys allowed)")
            self.validate_argument_dir(full, entry_rel)

    # ----- 3g: argument-dir leaf files ------------------------------------ #
    def validate_argument_dir(self, arg_path, rel):
        entries = self._entries(arg_path)
        missing = {name for name in ARGUMENT_REQUIRED_FILES if not (Path(arg_path) / name).is_file()}
        if missing:
            self.logger.log(f"{rel}: missing required file(s) {sorted(missing)}")
        try:
            expected = plan_cache_path(Path(arg_path), Path(self.root).resolve().parent).name
            alternates = {f"{sha}.json" for sha in alternate_fixture_shas(Path(arg_path))}
        except (OSError, ValueError) as exc:
            self.logger.log(f"{rel}: cannot determine committed plan: {exc}")
            expected, alternates = None, set()
        if expected and not (Path(arg_path) / expected).is_file():
            self.logger.log(f"{rel}: missing committed plan '{expected}' (run auto_test and commit its output)")
        fallback = {".terraform.lock.hcl", "plan", "plan.json", "tfplan", "tfplan.json",
                    "terraform.tfstate", "terraform.tfstate.backup", "crash.log"}
        for entry in entries:
            full = Path(arg_path) / entry
            if full.is_file() and entry in ARGUMENT_REQUIRED_FILES | {PLATFORM_CONFIG_FILE, expected}:
                continue
            ignored = self.ignored is not None and os.path.normpath(os.path.relpath(full)) in self.ignored
            if ignored or (self.ignored is None and entry in fallback):
                continue
            if full.is_dir():
                # Local ignored terraform directories are allowed, but tracked children are not.
                if entry == ".terraform" and (self.ignored is None or all(
                        os.path.normpath(os.path.relpath(f)) in self.ignored
                        for f in full.rglob("*") if f.is_file())):
                    continue
                self.logger.log(f"{rel}/{entry}: directories not allowed in an argument dir")
            elif entry.endswith(".json"):
                why = "named from CRLF line endings (or a UTF-8 BOM)" if entry in alternates else "stale or not a committed plan filename"
                self.logger.log(f"{rel}/{entry}: unexpected .json ({why}); expected '{expected}'")
            else:
                self.logger.log(f"{rel}/{entry}: unexpected file (git would commit this; remove it or add it to .gitignore)")


# =========================================================================== #
# CONTENT CHECKS (on by default; `--no-content-checks` to skip)
# --------------------------------------------------------------------------- #
# Everything ABOVE this banner is the structural/taxonomy linter; it never opens
# a .tf or .rego file. The checks BELOW read *inside* files. They run by default
# (the fixture backlog is cleared — the whole tree passes); pass
# `--no-content-checks` for structural validation only. Rules:
#   A. policies: each .rego `package` matches its path —
#      terraform.gcp.security.<service>.<resource>.<seg>  (seg = the ARGUMENT DIR
#      name with '.'->'_'; _vars.rego -> .<resource>.vars). The <service> segment
#      is not asserted (the on-disk service dir name differs from the slug).
#   B. fixtures: a fixture (compliant.tf / nonCompliant.tf) contains ONLY the
#      tested resource type (== its dir); dependency resources are disallowed
#      (we run `tf plan` only, so the tested resource uses fake values instead).
#   C. fixtures: tested-resource labels follow the example convention,
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

    def __init__(self, policies_root, logger):
        self.policies_root = policies_root
        self.logger = logger

    def validate(self, only_platform=None):
        # Only gcp is populated today; aws/azure are .gitkeep placeholders.
        if only_platform and only_platform != "gcp":
            return
        self._check_policies_packages(os.path.join(self.policies_root, "gcp"))

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

    # ----- A, B & C: one walk over policies/gcp --------------------------- #
    FIXTURES = (("compliant.tf", "compliant_example"),
                ("nonCompliant.tf", "non_compliant_example"))

    def _check_policies_packages(self, gcp_root):
        """A: each .rego `package` must sit at its path. B & C: fixture contents.

        Package expected: ``terraform.gcp.security.<service_seg>.<resource>.<seg>``
        where ``<seg>`` is the ARGUMENT with dots->underscores (argument dirs may carry
        dotted docs keys; packages sanitise them). ``_vars.rego`` -> ``.<resource>.vars``.

        The argument now comes from the DIRECTORY name, since every policy file is
        called policy.rego; only ``_vars.rego`` still contributes its own name.

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
                continue                       # skips the platform-level config.tf
            for resource in sorted(os.listdir(svc)):
                res = os.path.join(svc, resource)
                if not os.path.isdir(res):
                    continue
                for entry in sorted(os.listdir(res)):
                    path = os.path.join(res, entry)
                    if os.path.isdir(path):
                        self._check_argument_dir(path, service, resource, entry)
                    elif entry == POLICY_VARS_FILE:
                        self._check_package(
                            path, f"policies/gcp/{service}/{resource}/{entry}", resource, "vars")

    def _check_argument_dir(self, arg_path, service, resource, argument):
        """The policy.rego package (A) plus both fixtures (B & C) for one argument."""
        rel_dir = f"policies/gcp/{service}/{resource}/{argument}"
        policy_path = os.path.join(arg_path, POLICY_FILE)
        if os.path.isfile(policy_path):
            self._check_package(policy_path, f"{rel_dir}/{POLICY_FILE}",
                                resource, argument.replace(".", "_"))
        for tf_name, label_prefix in self.FIXTURES:
            tf_path = os.path.join(arg_path, tf_name)
            if os.path.isfile(tf_path):
                self._check_tf_file(tf_path, f"{rel_dir}/{tf_name}", resource, label_prefix)

    def _check_package(self, path, rel, resource, seg):
        pkg = self._read_package(path)
        if pkg is None:
            self.logger.log(f"[content] {rel}: no `package` declaration found")
            return
        if not pkg.startswith("terraform.gcp.security."):
            self.logger.log(
                f"[content] {rel}: package {pkg!r} must start with 'terraform.gcp.security.'")
        expected_suffix = f".{resource}.{seg}"
        if not pkg.endswith(expected_suffix):
            self.logger.log(
                f"[content] {rel}: package {pkg!r} must end with '{expected_suffix}'")

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
        description="Validate the docs/ and policies/ trees (structure + cross-reconciliation).")
    parser.add_argument("--docs", default="docs", help="Path to the docs root (default: docs).")
    parser.add_argument("--policies", default="policies", help="Path to the policies root (default: policies).")
    parser.add_argument("--tree", choices=["docs", "policies", "all"], default="all",
                        help="Which tree(s) to validate (default: all).")
    parser.add_argument("--platform", choices=sorted(ALLOWED_PLATFORMS), default=None,
                        help="Limit validation to a single platform.")
    parser.add_argument("--content-checks", action=argparse.BooleanOptionalAction, default=True,
                        help="Run the content checks (rego package paths, single tested resource, "
                             "example label convention). On by default; use --no-content-checks "
                             "to skip and run structural validation only.")
    args = parser.parse_args(argv)

    docs_root = os.path.abspath(args.docs)
    policies_root = os.path.abspath(args.policies)
    logger = ErrorLogger()

    do_docs = args.tree in ("docs", "all")
    do_policies = args.tree in ("policies", "all")

    # The docs index reconciles the policies tree; build it once (parsing every docs
    # JSON is the linter's dominant I/O cost).
    docs_index = None
    if do_policies:
        if not os.path.isdir(docs_root):
            print(f"[ERROR] docs root not found: {docs_root} (needed to reconcile policies).")
            sys.exit(2)
        docs_index = build_gcp_docs_index(docs_root)

    if do_docs:
        if not os.path.isdir(docs_root):
            print(f"[ERROR] docs root not found: {docs_root} (run from the repo root or pass --docs).")
            sys.exit(2)
        print(f"\n[*] Linting docs tree at {docs_root}"
              f"{f' (platform: {args.platform})' if args.platform else ''}\n")
        DocsValidator(docs_root, logger).validate_root(only_platform=args.platform)

    if do_policies:
        if not os.path.isdir(policies_root):
            print(f"[ERROR] policies root not found: {policies_root} (run from the repo root or pass --policies).")
            sys.exit(2)
        print(f"\n[*] Linting policies tree at {policies_root}"
              f"{f' (platform: {args.platform})' if args.platform else ''}\n")
        PoliciesValidator(policies_root, docs_index, logger).validate_root(only_platform=args.platform)
        legacy_inputs = Path(policies_root).parent / "inputs" / "gcp"
        if (args.platform in (None, "gcp") and legacy_inputs.is_dir()
                and any(p.is_file() for p in legacy_inputs.rglob("*") if p.name != ".gitkeep")):
            logger.log("inputs/gcp/: legacy fixture tree remains; complete the layout migration")

    if args.content_checks:
        print("\n[*] Running content checks\n")
        if do_docs:
            DocsCanonicalValidator(docs_root, logger).validate(only_platform=args.platform)
        if do_policies:
            ContentChecksValidator(policies_root, logger).validate(only_platform=args.platform)

    if logger.summary():
        sys.exit(1)


if __name__ == "__main__":
    main()
