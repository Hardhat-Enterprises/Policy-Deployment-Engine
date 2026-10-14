#!/usr/bin/env python3
"""Tests for validity_check (Milestone 3). Run: python test_validity_check.py"""
from policy_registry import make_uid, seed_from_schema, get_validity
from validity_check import applies, run_validity

results = []
def check(name, cond, detail=""):
    results.append((name, cond))
    print(("PASS  " if cond else "FAIL  ") + name + (f"  [{detail}]" if detail and not cond else ""))

# Two version snapshots 
schema_7_0 = {
    "google_compute_snapshot": {"name": {}, "source_disk_encryption_key.raw_key": {}},
}
schema_7_37 = {
    "google_compute_snapshot": {
        "name": {}, "source_disk_encryption_key.raw_key": {},
        "deletion_policy": {}, 
    },
}

uid_raw = make_uid("google_compute_snapshot", "source_disk_encryption_key.raw_key")
uid_new = make_uid("google_compute_snapshot", "deletion_policy")
uid_gone = make_uid("google_compute_snapshot", "removed_argument")

# 1. applies() checks resource then argument
ok, _ = applies(uid_raw, schema_7_0)
check("applies is true when resource and argument both exist", ok is True)
ok, reason = applies(uid_new, schema_7_0)
check("applies is false when the argument is absent", ok is False and "argument not in" in reason, reason)
ok, reason = applies(make_uid("google_compute_missing", "x"), schema_7_0)
check("applies is false when the resource is absent", ok is False and "resource type not in" in reason, reason)

# Build a seeded map from both versions
vmap = {}
seed_from_schema(vmap, schema_7_0, "7.0.0")
seed_from_schema(vmap, schema_7_37, "7.37.0")

# 2. run without test results: applicability fills in, applicable ones stay pending
stats = run_validity(vmap, {"7.0.0": schema_7_0, "7.37.0": schema_7_37}, test_results=None)
# deletion_policy does not exist in 7.0.0 -> not applicable there
check("new argument is not valid on the old version",
      get_validity(vmap, uid_new, "7.0.0")["valid"] is False
      and "not in this version" in get_validity(vmap, uid_new, "7.0.0").get("reason", ""))
# deletion_policy exists in 7.37.0 -> applies, but no test yet -> pending (untested)
check("new argument applies but is pending on the new version (no test run)",
      get_validity(vmap, uid_new, "7.37.0") == {"tested": False, "valid": False, "reason": "applies; policy test pending"})
# raw_key exists in both -> both pending without test results
check("argument present in both versions is pending without test results",
      get_validity(vmap, uid_raw, "7.0.0")["tested"] is False
      and get_validity(vmap, uid_raw, "7.37.0")["tested"] is False)

# 3. run WITH test results: step 3 fills valid/fail
test_results = {
    uid_raw: {"7.0.0": True, "7.37.0": True},
    uid_new: {"7.37.0": False},  # policy exists but fails its test on 7.37
}
stats = run_validity(vmap, {"7.0.0": schema_7_0, "7.37.0": schema_7_37}, test_results)
check("passing test marks the policy valid",
      get_validity(vmap, uid_raw, "7.0.0") == {"tested": True, "valid": True, "reason": "policy test passed"})
check("failing test marks the policy failed, not valid",
      get_validity(vmap, uid_new, "7.37.0") == {"tested": True, "valid": False, "reason": "policy test failed"})
check("not-applicable stays not-applicable even after a results run",
      get_validity(vmap, uid_new, "7.0.0")["valid"] is False
      and "not in this version" in get_validity(vmap, uid_new, "7.0.0").get("reason", ""))

# 4. a real result is never overwritten back to pending on a later no-results run
run_validity(vmap, {"7.0.0": schema_7_0}, test_results=None)
check("a real valid result is preserved on a later run without results",
      get_validity(vmap, uid_raw, "7.0.0") == {"tested": True, "valid": True, "reason": "policy test passed"})

# 5. summary counts are returned
check("run_validity returns a summary dict",
      set(stats.keys()) == {"not_applicable", "valid", "failed", "pending"})

def test_suite():
    """pytest entry point: fail if any check above did not pass."""
    _failed = [name for name, ok in results if not ok]
    assert not _failed, f"{len(_failed)} check(s) failed: {_failed}"


if __name__ == "__main__":
    _failed = [r for r in results if not r[1]]
    print(f"\n{len(results) - len(_failed)}/{len(results)} passed")
    raise SystemExit(1 if _failed else 0)
