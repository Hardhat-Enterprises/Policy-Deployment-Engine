#!/usr/bin/env python3
"""Tests for policy_registry. Run: python test_policy_registry.py"""
import os
import tempfile

from policy_registry import (
    make_uid, parse_uid, load_map, save_map,
    set_validity, get_validity, seed_from_schema,
)

results = []
def check(name, cond, detail=""):
    results.append((name, cond))
    print(("PASS  " if cond else "FAIL  ") + name + (f"  [{detail}]" if detail and not cond else ""))

# 1. uid is built and parsed back, with no version in it
uid = make_uid("google_compute_snapshot", "source_disk_encryption_key.raw_key")
rt, ap = parse_uid(uid)
check("uid round-trips and holds no version",
      uid == "google_compute_snapshot::source_disk_encryption_key.raw_key"
      and rt == "google_compute_snapshot"
      and ap == "source_disk_encryption_key.raw_key"
      and "7." not in uid, uid)

# 2. set and get validity for a version
vmap = {}
set_validity(vmap, uid, "7.0.0", tested=True, valid=True)
check("records tested/valid for a version",
      get_validity(vmap, uid, "7.0.0") == {"tested": True, "valid": True})

# 3. unknown uid/version defaults to not-tested
check("unknown entry defaults to not tested",
      get_validity(vmap, uid, "9.9.9") == {"tested": False, "valid": False})

# 4. same policy can differ across versions (the whole point: no range assumption)
set_validity(vmap, uid, "7.1.0", tested=True, valid=True)
set_validity(vmap, uid, "7.2.0", tested=True, valid=False)  # valid on 7.1 but NOT 7.2
check("a policy can be valid on one version and invalid on another",
      get_validity(vmap, uid, "7.1.0")["valid"] is True
      and get_validity(vmap, uid, "7.2.0")["valid"] is False)

# 5. cannot be valid without being tested
try:
    set_validity({}, uid, "7.0.0", tested=False, valid=True)
    ok = False
except ValueError:
    ok = True
check("cannot mark valid without tested", ok)

# 6. seeding adds an untested entry per argument, and does not overwrite real results
schema = {
    "google_compute_snapshot": {
        "name": {}, "source_disk_encryption_key.raw_key": {},
    },
    "google_compute_region_commitment": {"name": {}, "region": {}},
}
vmap2 = {}
set_validity(vmap2, "google_compute_snapshot::name", "7.37.0", tested=True, valid=True)
added = seed_from_schema(vmap2, schema, "7.37.0")
check("seed adds one entry per argument (minus the one already present)",
      added == 3, f"added={added}")
check("seed does not overwrite an existing real result",
      get_validity(vmap2, "google_compute_snapshot::name", "7.37.0") == {"tested": True, "valid": True})
check("seeded entries start untested",
      get_validity(vmap2, "google_compute_region_commitment::region", "7.37.0")
      == {"tested": False, "valid": False})

# 7. save then load round-trips through disk
f = tempfile.NamedTemporaryFile(suffix=".json", delete=False); f.close()
save_map(vmap2, f.name)
reloaded = load_map(f.name)
check("map survives save then load", reloaded == vmap2)
os.unlink(f.name)

# 8. load_map on a missing file returns empty, not an error
check("missing map file loads as empty", load_map("does_not_exist_12345.json") == {})

print()
failed = [r for r in results if not r[1]]
print(f"{len(results) - len(failed)}/{len(results)} passed")
raise SystemExit(1 if failed else 0)
