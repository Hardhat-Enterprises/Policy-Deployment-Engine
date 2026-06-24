#!/usr/bin/env python3
"""
linter_v2 — validates the ``docs/`` tree: folder structure + GCP doc JSON schema.

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

Run from the repo root (the folder containing ``docs/``):
    uv run python scripts/linters/linter_v2.py
    uv run python scripts/linters/linter_v2.py --docs docs --platform gcp
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


def main():
    parser = argparse.ArgumentParser(
        description="Validate the docs/ tree structure and GCP doc JSON schema.")
    parser.add_argument("--docs", default="docs", help="Path to the docs root (default: docs).")
    parser.add_argument("--platform", choices=sorted(ALLOWED_PLATFORMS), default=None,
                        help="Limit validation to a single platform.")
    args = parser.parse_args()

    docs_root = os.path.abspath(args.docs)
    if not os.path.isdir(docs_root):
        print(f"[ERROR] docs root not found: {docs_root} "
              f"(run from the repo root or pass --docs).")
        sys.exit(2)

    logger = ErrorLogger()
    print(f"\n[*] Linting docs tree at {docs_root}"
          f"{f' (platform: {args.platform})' if args.platform else ''}\n")
    DocsValidator(docs_root, logger).validate_root(only_platform=args.platform)

    if logger.summary():
        sys.exit(1)


if __name__ == "__main__":
    main()
