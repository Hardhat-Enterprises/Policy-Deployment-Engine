#!/usr/bin/env python3
"""Eliminate every ``google-beta`` reference from the GCP test fixtures/policies.

Docgen no longer pulls beta provider docs, so beta-only resources have no home in
the GA taxonomy. For each beta fixture this script decides convert-or-delete using
the **GA ``hashicorp/google`` provider schema** as the authoritative "is this in
the GA provider / main docs now" signal:

  * resource type present in the GA schema  -> convert to GA ``google`` in place
    (rewrite ``config.tf`` to the standard google template, strip the
    ``provider = google-beta`` meta-arg from the resource ``.tf`` files).
  * resource type absent from the GA schema -> delete the input fixture dir and
    the matching policy ``.rego``; prune now-empty resource/service dirs.

Provider versions/locks are normalised separately by ``unify_provider_versions.py``.

Run from the repo root, after the project-local mirror exists (see cache_setup.sh):
    python3 scripts/auto_test/eliminate_beta.py [--apply]
Without --apply it only reports what it would do (dry run).
"""
import argparse
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[2]
CACHE_ROOT = REPO_ROOT / ".terraform-cache"
CLI_CONFIG_FILE = CACHE_ROOT / "cli.tfrc"
INPUTS_ROOT = REPO_ROOT / "inputs" / "gcp"
POLICIES_ROOT = REPO_ROOT / "policies" / "gcp"

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

PROVIDER_BETA_LINE = re.compile(r"^[ \t]*provider[ \t]*=[ \t]*google-beta[ \t]*\r?\n", re.MULTILINE)


def ga_resource_types() -> set[str]:
    """Return the set of GA google resource type names from the provider schema."""
    env = os.environ.copy()
    env["TF_CLI_CONFIG_FILE"] = str(CLI_CONFIG_FILE)
    with tempfile.TemporaryDirectory() as tmp:
        (Path(tmp) / "main.tf").write_text(
            'terraform {\n  required_providers {\n    google = {\n'
            '      source = "hashicorp/google"\n    }\n  }\n}\n'
        )
        subprocess.run(["terraform", "init", "-no-color"], cwd=tmp, env=env,
                       capture_output=True, text=True, check=True)
        out = subprocess.run(["terraform", "providers", "schema", "-json"], cwd=tmp,
                             env=env, capture_output=True, text=True, check=True)
    schema = json.loads(out.stdout)
    key = "registry.terraform.io/hashicorp/google"
    return set(schema["provider_schemas"][key]["resource_schemas"].keys())


def is_beta_dir(d: Path) -> bool:
    for f in d.iterdir():
        if f.suffix == ".tf" or f.name == ".terraform.lock.hcl":
            if "google-beta" in f.read_text(encoding="utf-8", errors="ignore"):
                return True
    return False


def find_beta_dirs() -> list[Path]:
    dirs = []
    for root, _, files in os.walk(INPUTS_ROOT):
        rp = Path(root)
        if any(f.endswith(".tf") for f in files) and is_beta_dir(rp):
            dirs.append(rp)
    return sorted(dirs)


def convert_dir(d: Path, apply: bool):
    """Rewrite config.tf to GA google and strip provider=google-beta meta-args."""
    if apply:
        (d / "config.tf").write_text(GOOGLE_CONFIG_TF)
    for tf in d.glob("*.tf"):
        if tf.name == "config.tf":
            continue
        text = tf.read_text(encoding="utf-8", errors="ignore")
        new = PROVIDER_BETA_LINE.sub("", text)
        if new != text and apply:
            tf.write_text(new)


def delete_dir(d: Path, apply: bool):
    """Delete a beta-only input fixture + its policy; prune empty parents."""
    rel = d.relative_to(INPUTS_ROOT)            # <svc>/<resource>/<arg>
    policy = POLICIES_ROOT / rel.parent / f"{rel.name}.rego"
    if apply:
        shutil.rmtree(d)
        policy.unlink(missing_ok=True)
        # prune resource dir if no remaining argument fixtures
        res_in = INPUTS_ROOT / rel.parent
        if res_in.exists() and not any(p.is_dir() for p in res_in.iterdir()):
            shutil.rmtree(res_in, ignore_errors=True)
            res_pol = POLICIES_ROOT / rel.parent      # contains only _vars.rego now
            shutil.rmtree(res_pol, ignore_errors=True)
        # prune empty service dirs
        for base in (INPUTS_ROOT / rel.parts[0], POLICIES_ROOT / rel.parts[0]):
            if base.exists() and not any(base.iterdir()):
                base.rmdir()


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--apply", action="store_true", help="apply changes (default: dry run)")
    args = ap.parse_args()

    ga = ga_resource_types()
    print(f"GA google resource types: {len(ga)}")

    beta_dirs = find_beta_dirs()
    converted, deleted = [], []
    for d in beta_dirs:
        rt = d.parent.name  # google_<resource>
        if rt in ga:
            convert_dir(d, args.apply)
            converted.append(d)
        else:
            delete_dir(d, args.apply)
            deleted.append(d)

    mode = "APPLIED" if args.apply else "DRY RUN"
    print(f"\n[{mode}] beta leaf fixtures: {len(beta_dirs)}")
    print(f"  converted to GA google: {len(converted)}")
    print(f"  deleted (beta-only)   : {len(deleted)}")
    if deleted:
        print("  deleted resource types:",
              ", ".join(sorted({d.parent.name for d in deleted})))
    if not args.apply:
        print("\n(dry run — re-run with --apply to make changes)")


if __name__ == "__main__":
    main()
