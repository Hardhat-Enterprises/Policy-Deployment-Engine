#!/usr/bin/env python3
"""Tests for schema_differ. Run: python3 test_differ.py"""
import json, tempfile, os, sys
from schema_differ import load_schema, build_changeset, analyse_migration, detect_renames, flatten_block

TH, RB = 0.72, 0.55
def A(t, d, req=False): return {"type": t, "description": d, "required": req, "optional": not req}
def wrap(res): return {"format_version":"1.0","provider_schemas":{"registry.terraform.io/hashicorp/google":{"resource_schemas":res}}}

def write(obj):
    f = tempfile.NamedTemporaryFile("w", suffix=".json", delete=False)
    json.dump(obj, f); f.close(); return f.name

results = []
def check(name, cond, detail=""):
    results.append((name, cond, detail))
    print(("PASS  " if cond else "FAIL  ") + name + (f"  [{detail}]" if detail and not cond else ""))

# 1. Check the rename detection: spelling rename must be detected
old = {"r": {"block": {"attributes": {
    "dest_network_context": A("string", "Network context of the destination for the rule.")}}}}
new = {"r": {"block": {"attributes": {
    "dest_network_scope": A("string", "Network scope of the destination for the rule.")}}}}
cs = build_changeset(load_schema(write(wrap(old))), load_schema(write(wrap(new))), "a", "b", TH, RB)
ren = cs["resources_changed"]["r"]["renamed"]
check("detects dest_network_context -> dest_network_scope", len(ren) == 1 and ren[0]["to"] == "dest_network_scope",
      f"got {ren}")

# 2. False positive check: unrelated remove + add must NOT be paired
old = {"r": {"block": {"attributes": {
    "name": A("string", "Name of the resource.", True),
    "old_flag": A("bool", "A legacy boolean toggle that is going away.")}}}}
new = {"r": {"block": {"attributes": {
    "name": A("string", "Name of the resource.", True),
    "security_profile_group": A("string", "A fully-qualified URL of a security profile group.")}}}}
cs = build_changeset(load_schema(write(wrap(old))), load_schema(write(wrap(new))), "a", "b", TH, RB)
d = cs["resources_changed"]["r"]
check("does NOT pair unrelated old_flag -> security_profile_group",
      len(d["renamed"]) == 0 and len(d["possible_renames"]) == 0 and d["removed"] == ["old_flag"],
      f"renamed={d['renamed']} possible={d['possible_renames']}")

# 3. Rename must not cross parent blocks
old = {"r": {"block": {"attributes": {}, "block_types": {
    "a_block": {"nesting_mode":"list","block":{"attributes":{"key_link": A("string","The encryption key link.")}}},
    "b_block": {"nesting_mode":"list","block":{"attributes":{"other": A("string","Unrelated field.")}}}}}}}
new = {"r": {"block": {"attributes": {}, "block_types": {
    "a_block": {"nesting_mode":"list","block":{"attributes":{"other": A("string","Unrelated field.")}}},
    "b_block": {"nesting_mode":"list","block":{"attributes":{"key_link": A("string","The encryption key link.")}}}}}}}
cs = build_changeset(load_schema(write(wrap(old))), load_schema(write(wrap(new))), "a", "b", TH, RB)
d = cs["resources_changed"]["r"]
crossed = [r for r in d["renamed"] + d["possible_renames"]
           if r["from"].split(".")[0] != r["to"].split(".")[0]]
check("never pairs a rename across different parent blocks", len(crossed) == 0, f"crossed={crossed}")

# 4. Type change is flagged, not silently carried forward
old = {"r": {"block": {"attributes": {"priority": A("number", "Priority of the rule.", True)}}}}
new = {"r": {"block": {"attributes": {"priority": A("string", "Priority of the rule.", True)}}}}
cs = build_changeset(load_schema(write(wrap(old))), load_schema(write(wrap(new))), "a", "b", TH, RB)
tc = cs["resources_changed"]["r"]["type_changed"]
check("flags a type change for review", len(tc) == 1 and tc[0]["from"] == "number" and tc[0]["to"] == "string", f"got {tc}")

# 5. Identical schemas => 100% auto migrate, nothing flagged
same = {"r": {"block": {"attributes": {"name": A("string","Name.",True), "x": A("bool","Toggle.")}}}}
o, n = load_schema(write(wrap(same))), load_schema(write(wrap(same)))
cs = build_changeset(o, n, "a", "b", TH, RB); an = analyse_migration(cs, o, n)
check("identical schemas give 100% auto-migrate",
      an["auto_migrate_percent"] == 100.0 and an["needs_human_review"] == 0 and an["retired"] == 0,
      f"got {an['auto_migrate_percent']}%")

#6. Nested block attributes are flattened with dotted paths
blk = {"attributes": {"name": A("string","n")}, "block_types": {
    "enc": {"nesting_mode":"list","block":{"attributes":{"raw_key": A("string","k")}}}}}
flat = flatten_block(blk)
check("flattens nested block args to dotted paths", "enc.raw_key" in flat and "enc" in flat, f"got {sorted(flat)}")

# 7. Renamed argument counts as migrated, not retired
old = {"r": {"block": {"attributes": {"dest_network_context": A("string","Network context of the destination.")}}}}
new = {"r": {"block": {"attributes": {"dest_network_scope": A("string","Network scope of the destination.")}}}}
o, n = load_schema(write(wrap(old))), load_schema(write(wrap(new)))
cs = build_changeset(o, n, "a", "b", TH, RB); an = analyse_migration(cs, o, n)
check("a rename is migrated, not retired",
      an["carried_forward_via_rename"] == 1 and an["retired"] == 0, f"retired={an['retired']}")

def test_suite():
    """pytest entry point: fail if any check above did not pass."""
    _failed = [r[0] for r in results if not r[1]]
    assert not _failed, f"{len(_failed)} check(s) failed: {_failed}"


if __name__ == "__main__":
    _failed = [r for r in results if not r[1]]
    print(f"\n{len(results) - len(_failed)}/{len(results)} passed")
    sys.exit(1 if _failed else 0)
