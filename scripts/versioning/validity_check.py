#!/usr/bin/env python3
"""
For each policy (uid) and each provider version, decide whether that version
should point to the policy, using Yotam's 3-step rule:

    1. the resource type exists in that version's schema, then
    2. the argument exists in that resource, then
    3. the policy passes its test.

If step 1 or 2 fails, the version does not point to the policy (valid = false).
Steps 1 and 2 are computed automatically from the provider schema. Step 3
reuses the project's own test harness: pass its results in with
--results. Where a policy applies but no test result is supplied, the entry is
left as "pending" so we never claim a pass we did not run.

Read-only: writes only the validity-map JSON. Never touches docs/, inputs/, policies/.

Usage:
    python validity_check.py \
        --map validity_map.json \
        --schema 7.0.0=schema_old.json \
        --schema 7.37.0=schema_new.json \
        --provider google \
        --only-resource google_compute_snapshot \
        [--results policy_test_results.json]
"""

import argparse
import json

from schema_differ import load_schema
from policy_registry import load_map, save_map, set_validity, get_validity, parse_uid


def applies(uid, schema_by_resource):
    """Steps 1 and 2: does the resource type, then the argument, exist here?"""
    resource_type, argument_path = parse_uid(uid)
    if resource_type not in schema_by_resource:
        return False, "resource type not in this version"
    if argument_path not in schema_by_resource[resource_type]:
        return False, "argument not in this version"
    return True, "resource and argument present"


def run_validity(vmap, schemas_by_version, test_results=None):
    """Fill the map for every uid across the given versions. Returns a summary."""
    stats = {"not_applicable": 0, "valid": 0, "failed": 0, "pending": 0}
    for uid in list(vmap.keys()):
        for version, schema in schemas_by_version.items():
            ok, reason = applies(uid, schema)
            if not ok:
                # Step 1 or 2 failed: the version does not point to this policy.
                set_validity(vmap, uid, version, tested=True, valid=False, reason=reason)
                stats["not_applicable"] += 1
                continue
            # Steps 1 and 2 passed. Step 3 is the real policy test.
            has_result = (
                test_results is not None
                and uid in test_results
                and version in test_results[uid]
            )
            if has_result:
                passed = bool(test_results[uid][version])
                set_validity(vmap, uid, version, tested=True, valid=passed,
                             reason="policy test passed" if passed else "policy test failed")
                stats["valid" if passed else "failed"] += 1
            else:
                # Applies, but the OPA test has not been run for this version.
                # Do not fake a pass. Only mark pending if not already tested.
                if not get_validity(vmap, uid, version)["tested"]:
                    set_validity(vmap, uid, version, tested=False, valid=False,
                                 reason="applies; policy test pending")
                stats["pending"] += 1
    return stats


def _parse_schema_arg(value):
    """Split a --schema VERSION=PATH argument into (version, path)."""
    version, sep, path = value.partition("=")
    if not sep or not version or not path:
        raise argparse.ArgumentTypeError(
            f"--schema must look like 7.37.0=path/to/schema.json, got {value!r}"
        )
    return version, path


def main():
    ap = argparse.ArgumentParser(description="Fill the validity map with the 3-step check.")
    ap.add_argument("--map", default="validity_map.json")
    ap.add_argument("--schema", action="append", required=True, type=_parse_schema_arg,
                    help="VERSION=PATH, repeatable (e.g. 7.37.0=schema_new.json)")
    ap.add_argument("--provider", default="google")
    ap.add_argument("--only-resource", action="append", default=None)
    ap.add_argument("--results", default=None,
                    help="optional JSON of OPA test results: {uid: {version: bool}}")
    args = ap.parse_args()

    schemas_by_version = {}
    for version, path in args.schema:
        schema = load_schema(path, args.provider)
        if args.only_resource:
            keep = set(args.only_resource)
            schema = {k: v for k, v in schema.items() if k in keep}
        schemas_by_version[version] = schema

    test_results = None
    if args.results:
        with open(args.results, encoding="utf-8") as fh:
            test_results = json.load(fh)

    vmap = load_map(args.map)
    if not vmap:
        raise SystemExit(f"{args.map} is empty. Run policy_registry.py seed first.")

    stats = run_validity(vmap, schemas_by_version, test_results)
    save_map(vmap, args.map)

    print("Validity check complete. Entries updated:")
    print(f"  not applicable (arg/resource absent) : {stats['not_applicable']}")
    print(f"  valid (passed test)                  : {stats['valid']}")
    print(f"  failed (ran test, did not pass)      : {stats['failed']}")
    print(f"  pending (applies, test not run yet)  : {stats['pending']}")
    print(f"  -> {args.map}")
    if test_results is None:
        print("Note: no --results supplied, so step 3 (policy passes) was not run.")
        print("      Applicability (steps 1 and 2) has been filled in from the schema.")


if __name__ == "__main__":
    main()
