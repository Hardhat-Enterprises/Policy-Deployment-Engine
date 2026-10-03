#!/usr/bin/env python3
"""
PDE Version-Aware Policies — Step 3 bridge (build_results.py)

Runs the project's own auto_test for one resource, reads the pass/fail result, and
writes a results.json that validity_check.py can consume:

    { "<resource>::<argument>": { "<version>": true } }

It does NOT reimplement OPA. It shells out to the project's auto_test.py and reports
what that harness says. The policies for a resource are the argument folders under
inputs/<resource>. If auto_test reports all passed, every such argument is marked valid
for the given version. If any failed, it writes nothing and asks you to investigate,
so we never record a pass we did not actually get.

Usage:
    python build_results.py \
        --repo "E:\\Code\\SIT375\\Policy-Deployment-Engine" \
        --resource "gcp/Compute Engine/google_compute_network_firewall_policy_rule" \
        --version 7.37.0 \
        --out results.json
"""

import argparse
import json
import os
import re
import subprocess
import sys


def list_argument_folders(repo, resource):
    inputs_dir = os.path.join(repo, "inputs", *resource.split("/"))
    if not os.path.isdir(inputs_dir):
        raise SystemExit(f"inputs folder not found: {inputs_dir}")
    return sorted(
        name for name in os.listdir(inputs_dir)
        if os.path.isdir(os.path.join(inputs_dir, name))
    )


def run_auto_test(repo, resource):
    auto_test = os.path.join(repo, "scripts", "auto_test", "auto_test.py")
    if not os.path.isfile(auto_test):
        raise SystemExit(f"auto_test.py not found: {auto_test}")
    # Force the child (auto_test) to use UTF-8 for its output. On Windows a piped
    # child defaults to cp1252 and crashes when it prints emoji like the check mark.
    env = os.environ.copy()
    env["PYTHONIOENCODING"] = "utf-8"
    env["PYTHONUTF8"] = "1"
    proc = subprocess.run(
        [sys.executable, auto_test, resource],
        cwd=repo, capture_output=True, text=True,
        encoding="utf-8", errors="replace", env=env,
    )
    return proc.stdout + "\n" + proc.stderr


def parse_result(output):
    """Return (all_passed, passed, total). Robust to the emoji line encoding."""
    all_passed = "all passed" in output.lower()
    m = re.search(r"(\d+)\s*/\s*(\d+)", output)  # e.g. "9/9"
    passed = int(m.group(1)) if m else None
    total = int(m.group(2)) if m else None
    # A failed count line looks like "... 0  ..."; prefer the explicit "all passed" flag.
    fail_m = re.search(r"(\d+)\s*(?:failed|\bx\b)", output.lower())
    return all_passed, passed, total


def main():
    ap = argparse.ArgumentParser(description="Build results.json from the project's auto_test.")
    ap.add_argument("--repo", required=True, help="path to the Policy-Deployment-Engine repo")
    ap.add_argument("--resource", required=True,
                    help='e.g. "gcp/Compute Engine/google_compute_network_firewall_policy_rule"')
    ap.add_argument("--version", required=True, help="provider version these results are for, e.g. 7.37.0")
    ap.add_argument("--out", default="results.json")
    args = ap.parse_args()

    resource_type = args.resource.rstrip("/").split("/")[-1]
    arguments = list_argument_folders(args.repo, args.resource)
    if not arguments:
        raise SystemExit("no argument folders found under inputs/ for this resource")

    print(f"Found {len(arguments)} policy argument(s) for {resource_type}")
    output = run_auto_test(args.repo, args.resource)
    all_passed, passed, total = parse_result(output)
    print("auto_test said:", output.strip().splitlines()[-1] if output.strip() else "(no output)")

    if not all_passed:
        print("\nNot all policies passed (or the path matched nothing).")
        print("No results written, so we do not record a pass we did not get.")
        print("Run auto_test yourself to see which policy failed, then re-run once fixed.")
        raise SystemExit(1)

    results = {f"{resource_type}::{arg}": {args.version: True} for arg in arguments}
    with open(args.out, "w", encoding="utf-8") as fh:
        json.dump(results, fh, indent=2, sort_keys=True)
    print(f"\nAll {len(arguments)} policies passed on {args.version}.")
    print(f"Wrote {len(results)} results -> {args.out}")


if __name__ == "__main__":
    main()
