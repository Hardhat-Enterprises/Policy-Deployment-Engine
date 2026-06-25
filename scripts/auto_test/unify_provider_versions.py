#!/usr/bin/env python3
"""Normalise every GCP fixture to a single, unified provider version.

The fixtures historically pinned ~50 different ``hashicorp/google`` versions (via
per-directory ``.terraform.lock.hcl`` and some ``config.tf`` version lines). That
forced ``terraform init`` to resolve/download many provider versions. This script
collapses them to ONE version (``TARGET_VERSION``) so the project-local filesystem
mirror holds a single provider binary, reused (symlinked) by every fixture and
served fully offline.

For every leaf fixture directory (one containing ``config.tf``) it:
  * overwrites ``config.tf`` with the canonical google template (no version pin —
    this also repairs the few stray version-pinned and empty configs), and
  * writes the canonical ``.terraform.lock.hcl`` (pinning TARGET_VERSION with the
    mirror's linux_amd64 ``h1:`` hash).

Run AFTER eliminate_beta.py, from the repo root:
    python3 scripts/auto_test/unify_provider_versions.py [--apply]
"""
import argparse
import os
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[2]
CACHE_ROOT = REPO_ROOT / ".terraform-cache"
CANONICAL_LOCK = CACHE_ROOT / "canonical.lock.hcl"
INPUTS_ROOT = REPO_ROOT / "inputs" / "gcp"

# Single source of truth, shared with auto_test.py and cache_setup.sh.
TARGET_VERSION = (Path(__file__).resolve().parent / "provider_version.txt").read_text().strip()

GOOGLE_CONFIG_TF = """##### DO NOT EDIT ######

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
    }
  }
}

provider "google" {}
"""


def leaf_dirs() -> list[Path]:
    return sorted(
        Path(root)
        for root, _, files in os.walk(INPUTS_ROOT)
        if "config.tf" in files
    )


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--apply", action="store_true", help="apply changes (default: dry run)")
    args = ap.parse_args()

    lock_text = CANONICAL_LOCK.read_text()
    assert f'version = "{TARGET_VERSION}"' in lock_text, \
        f"canonical lock does not pin {TARGET_VERSION}; rebuild it (see cache_setup.sh)"

    dirs = leaf_dirs()
    config_changed = lock_written = 0
    for d in dirs:
        cfg = d / "config.tf"
        if cfg.read_text(encoding="utf-8", errors="ignore") != GOOGLE_CONFIG_TF:
            config_changed += 1
            if args.apply:
                cfg.write_text(GOOGLE_CONFIG_TF)
        lock = d / ".terraform.lock.hcl"
        if (not lock.exists()) or lock.read_text(encoding="utf-8", errors="ignore") != lock_text:
            lock_written += 1
            if args.apply:
                lock.write_text(lock_text)

    mode = "APPLIED" if args.apply else "DRY RUN"
    print(f"[{mode}] leaf fixtures: {len(dirs)} | target google {TARGET_VERSION}")
    print(f"  config.tf normalised: {config_changed}")
    print(f"  lock files written  : {lock_written}")
    if not args.apply:
        print("\n(dry run — re-run with --apply to make changes)")


if __name__ == "__main__":
    main()
