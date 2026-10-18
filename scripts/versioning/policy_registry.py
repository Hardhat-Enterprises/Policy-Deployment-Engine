#!/usr/bin/env python3
"""
- Each policy has a uid tied ONLY to a resource type and an argument, never a version.
  Example uid:  google_compute_snapshot::source_disk_encryption_key.raw_key

- A separate validity map records, per uid, for each provider version, whether the
  policy has been TESTED against that version and whether it is VALID there:

      {
        "google_compute_snapshot::source_disk_encryption_key.raw_key": {
          "7.0.0":  {"tested": true,  "valid": true},
          "7.37.0": {"tested": false, "valid": false}
        }
      }

Commands:
    seed  -read a version's schema and add a map entry for every argument in scope
    mark  -set tested/valid for one uid at one version
    show  -print the map in a readable table

Run the tests with:  python test_policy_registry.py
"""

import argparse
import json
import os
from schema_differ import load_schema

UID_SEP = "::"

# uid: the stable name of a policy (resource type + argument, no version)

def make_uid(resource_type, argument_path):
    """Build the stable id for a policy. Deliberately contains no version"""
    return f"{resource_type}{UID_SEP}{argument_path}"


def parse_uid(uid):
    """Split a uid back into (resource_type, argument_path)"""
    resource_type, _, argument_path = uid.partition(UID_SEP)
    if not argument_path:
        raise ValueError(f"not a valid uid: {uid!r}")
    return resource_type, argument_path
 
# The validity map: uid -> version -> {tested, valid}

def load_map(path):
    """Load the validity map, or return an empty one if the file does not exist"""
    if not os.path.exists(path):
        return {}
    with open(path, encoding="utf-8") as fh:
        return json.load(fh)


def save_map(vmap, path):
    """Write the validity map back to disk as UTF-8 JSON."""
    with open(path, "w", encoding="utf-8") as fh:
        json.dump(vmap, fh, indent=2, sort_keys=True)


def set_validity(vmap, uid, version, tested, valid, reason=None):
    """Record, for one policy at one version, whether it was tested and is valid
    A policy cannot be valid without being tested
    """
    if valid and not tested:
        raise ValueError("a policy cannot be marked valid without being tested")
    entry = {"tested": bool(tested), "valid": bool(valid)}
    if reason is not None:
        entry["reason"] = reason
    vmap.setdefault(uid, {})[version] = entry
    return vmap


def get_validity(vmap, uid, version):
    """Return {tested, valid} for a policy at a version"""
    return vmap.get(uid, {}).get(version, {"tested": False, "valid": False})


def seed_from_schema(vmap, schema_by_resource, version):
    """Add an entry for every argument in the given schema snapshot

    schema_by_resource is the {resource: {arg_path: info}} shape load_schema returns
    Existing entries are left untouched, so re-seeding never overwrites real results
    """
    added = 0
    for resource_type, args in schema_by_resource.items():
        for argument_path in args:
            uid = make_uid(resource_type, argument_path)
            entry = vmap.setdefault(uid, {})
            if version not in entry:
                entry[version] = {"tested": False, "valid": False}
                added += 1
    return added

# CLI
def _cmd_seed(args):
    schema = load_schema(args.schema, args.provider)
    if args.only_resource:
        keep = set(args.only_resource)
        schema = {k: v for k, v in schema.items() if k in keep}
    vmap = load_map(args.map)
    added = seed_from_schema(vmap, schema, args.version)
    save_map(vmap, args.map)
    print(f"seeded {added} new policy/version entries for {args.version}")
    print(f"map now holds {len(vmap)} policies -> {args.map}")


def _cmd_mark(args):
    vmap = load_map(args.map)
    set_validity(vmap, args.uid, args.version, args.tested, args.valid)
    save_map(vmap, args.map)
    print(f"set {args.uid} @ {args.version}: tested={args.tested} valid={args.valid}")


def _cmd_show(args):
    vmap = load_map(args.map)
    if not vmap:
        print("(empty map)")
        return
    versions = sorted({v for entry in vmap.values() for v in entry})
    print(f"{'policy uid':80}  " + "  ".join(versions))
    for uid in sorted(vmap):
        cells = []
        for v in versions:
            s = vmap[uid].get(v)
            if s is None:
                cells.append("-")
            elif s["valid"]:
                cells.append("valid")
            elif s["tested"] and "not in this version" in s.get("reason", ""):
                cells.append("n/a")
            elif s["tested"]:
                cells.append("FAIL")
            else:
                cells.append("?")
        print(f"{uid:80}  " + "  ".join(f"{c:{max(len(v),5)}}" for c, v in zip(cells, versions)))


def main():
    ap = argparse.ArgumentParser(description="PDE policy registry and validity map.")
    sub = ap.add_subparsers(dest="command", required=True)

    s = sub.add_parser("seed", help="add entries for every argument in a version's schema")
    s.add_argument("--schema", required=True)
    s.add_argument("--version", required=True, help="version label")
    s.add_argument("--provider", default="google")
    s.add_argument("--only-resource", action="append", default=None)
    s.add_argument("--map", default="validity_map.json")
    s.set_defaults(func=_cmd_seed)

    m = sub.add_parser("mark", help="set tested/valid for one uid at one version")
    m.add_argument("--uid", required=True)
    m.add_argument("--version", required=True)
    m.add_argument("--tested", action="store_true")
    m.add_argument("--valid", action="store_true")
    m.add_argument("--map", default="validity_map.json")
    m.set_defaults(func=_cmd_mark)

    sh = sub.add_parser("show", help="print the validity map")
    sh.add_argument("--map", default="validity_map.json")
    sh.set_defaults(func=_cmd_show)

    args = ap.parse_args()
    args.func(args)


if __name__ == "__main__":
    main()
