#!/usr/bin/env python3
"""Per-resource PR gate, driven by the branch name.

For a ``Service/<platform>/<service_slug>/<resource_type>`` branch this enforces,
scoped to that one resource:

  1. Doc completeness — every leaf argument in docs/<platform>/<folder>/<resource>.json
     has a REAL boolean ``security_impact`` (the ``"true/false"`` placeholder the
     linter still tolerates globally is rejected here) and a non-empty ``rationale``.
  2. True-arg coverage — every argument with ``security_impact: true`` has a complete
     policy directory ``policies/.../<resource>/<arg>/`` holding policy.rego,
     compliant.tf and nonCompliant.tf.
  3. OPA test — auto_test runs scoped to the resource (terraform plan + opa eval),
     which also enforces that each policy directory is complete.

The linter (gate "1. linter") is a separate CI job; this is the resource-specific
gate ("2." and "3."). Non-``Service/`` branches are a no-op (exit 0).

Run: ``python scripts/auto_test/check_resource_pr.py [--branch <ref>]``
(default branch is ``$GITHUB_HEAD_REF``). Exits non-zero on any failure.
"""
import argparse
import json
import os
import subprocess
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(REPO / "scripts" / "linters"))
from _service_slug import slug_to_folder  # noqa: E402

DOCS, POLICIES = "docs", "policies"
POLICY_FILE = "policy.rego"
FIXTURE_FILES = ("compliant.tf", "nonCompliant.tf")
AUTO_TEST = str(REPO / "scripts" / "auto_test" / "auto_test.py")

# TODO(after this migration branch merges to dev): confine a Service/ PR's DIFF to
# its selected service. Fail the PR if it changes any docs/ or policies/
# file outside `<tree>/<platform>/<folder>/` (service-level, per the owner's intent;
# could tighten to `<folder>/<resource>/` if desired). Add it as a step in the
# policy_check job (gated on Service/ branches) — e.g. compare
# `git diff --name-only origin/<base>...HEAD` against the selected service path.
# DEFERRED because this chore/ branch intentionally modified policies/docs
# across many services and must not be blocked by such a guardrail.


def parse_branch(branch):
    """Return (platform, slug, resource) for a Service/ branch, else None."""
    parts = branch.split("/")
    if len(parts) == 4 and parts[0] == "Service":
        return parts[1], parts[2], parts[3]
    return None


def leaf_args(doc):
    """Yield (name, entry) for leaf args — those carrying a ``security_impact``
    field. Block args (``type: block``) have no security_impact and are skipped."""
    for name, entry in doc.get("arguments", {}).items():
        if isinstance(entry, dict) and "security_impact" in entry:
            yield name, entry


def check_doc_completeness(doc):
    errors = []
    for name, entry in leaf_args(doc):
        si = entry.get("security_impact")
        if not isinstance(si, bool):
            errors.append(f"arg '{name}': security_impact must be a real true/false "
                          f"(found {si!r}; the \"true/false\" placeholder is not allowed)")
        rationale = entry.get("rationale")
        if not (isinstance(rationale, str) and rationale.strip()):
            errors.append(f"arg '{name}': rationale must be filled in (found {rationale!r})")
    return errors


def check_true_arg_coverage(doc, platform, folder, resource):
    """Every security-relevant argument needs a complete policy directory."""
    errors = []
    for name, entry in leaf_args(doc):
        if entry.get("security_impact") is not True:
            continue
        arg_dir = Path(POLICIES) / platform / folder / resource / name
        if not arg_dir.is_dir():
            errors.append(f"true arg '{name}': missing policy directory {arg_dir}/")
            continue
        for required in (POLICY_FILE, *FIXTURE_FILES):
            if not (arg_dir / required).is_file():
                errors.append(f"true arg '{name}': missing {arg_dir / required}")
    return errors


def run_auto_test(platform, folder, resource):
    policies = Path(POLICIES) / platform / folder / resource
    result = subprocess.run(
        [sys.executable, AUTO_TEST, "--policies", str(policies), "--verbose"],
        capture_output=True, text=True)
    if result.returncode != 0:
        return ["auto_test (terraform plan + OPA) failed:\n" + (result.stdout or "") + (result.stderr or "")]
    return []


def main(argv=None):
    parser = argparse.ArgumentParser(
        description="Per-resource PR gate: doc completeness, true-arg coverage, OPA test.")
    parser.add_argument("--branch", default=os.getenv("GITHUB_HEAD_REF"),
                        help="Service/ branch (default: $GITHUB_HEAD_REF).")
    args = parser.parse_args(argv)

    if not args.branch:
        print("No branch provided (GITHUB_HEAD_REF unset) — nothing to gate.")
        return 0
    parsed = parse_branch(args.branch)
    if not parsed:
        print(f"Branch '{args.branch}' is not a Service/ resource branch — skipping resource gate.")
        return 0
    platform, slug, resource = parsed

    folder = slug_to_folder(DOCS, platform).get(slug)
    if folder is None:
        print(f"[FAIL] service slug '{slug}' does not match any docs/{platform} service.")
        return 1
    doc_path = Path(DOCS) / platform / folder / f"{resource}.json"
    if not doc_path.is_file():
        print(f"[FAIL] resource doc not found: docs/{platform}/{folder}/{resource}.json")
        return 1
    doc = json.loads(doc_path.read_text(encoding="utf-8"))

    print(f"Resource gate: {platform} / {folder} / {resource}")

    structural = check_doc_completeness(doc) + check_true_arg_coverage(doc, platform, folder, resource)
    # Only spend time on terraform+OPA once the doc and coverage are sound.
    failures = structural if structural else run_auto_test(platform, folder, resource)

    if failures:
        print(f"\n[FAIL] resource gate failed for {resource} ({len(failures)} issue(s)):\n")
        for f in failures:
            print(f"  - {f}")
        return 1
    print(f"\n[OK] {resource}: doc complete, every true arg covered, OPA passed.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
