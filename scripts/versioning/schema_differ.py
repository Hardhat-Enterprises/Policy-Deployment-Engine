#!/usr/bin/env python3
"""
PDE Version-Aware Policies (read-only)

Compares two Terraform provider schemas and reports what changed, so we can tell
which existing policies still hold on a new provider version

Usage:
1. Dump a provider schema (run inside a dir with the provider version pinned)
    terraform providers schema -json > schema_7.0.json

 2. Compare two dumps
    python schema_differ.py schema_7.0.json schema_7.37.json \\
        --provider google --out report/

Outputs:
    changeset.json    raw changes summary
    report.md         rewrite summary + migration analysis
"""

import argparse
import json
import os
import sys
from difflib import SequenceMatcher

# Loading and flattening

def load_schema(path, provider_filter=None):
    """Read `terraform providers schema -json` output into {resource: {arg_path: info}}"""
    with open(path, encoding="utf-8") as fh:
        raw = json.load(fh)

    provider_schemas = raw.get("provider_schemas")
    if not provider_schemas:
        raise SystemExit(f"{path}: no provider_schemas key. Is this a terraform schema dump?")

    resources = {}
    for provider_addr, pdata in provider_schemas.items():
        if provider_filter and provider_filter not in provider_addr:
            continue
        for rname, rdata in (pdata.get("resource_schemas") or {}).items():
            resources[rname] = flatten_block(rdata.get("block", {}))
    if not resources:
        raise SystemExit(f"{path}: no resources matched provider filter {provider_filter!r}")
    return resources


def flatten_block(block, prefix=""):
    out = {}
    for name, attr in (block.get("attributes") or {}).items():
        path = f"{prefix}{name}"
        out[path] = {
            "type": normalise_type(attr.get("type")),
            "description": (attr.get("description") or "").strip(),
            "required": bool(attr.get("required")),
            "optional": bool(attr.get("optional")),
            "computed": bool(attr.get("computed")),
            "kind": "attribute",
        }
    for name, bt in (block.get("block_types") or {}).items():
        path = f"{prefix}{name}"
        out[path] = {
            "type": f"block:{bt.get('nesting_mode', 'single')}",
            "description": (bt.get("block", {}).get("description") or "").strip(),
            "required": (bt.get("min_items") or 0) > 0,
            "optional": (bt.get("min_items") or 0) == 0,
            "computed": False,
            "kind": "block",
        }
        out.update(flatten_block(bt.get("block", {}), prefix=f"{path}."))
    return out


def normalise_type(t):
    """Terraform types can be strings or nested lists; render them stably"""
    if t is None:
        return "unknown"
    if isinstance(t, str):
        return t
    return json.dumps(t, sort_keys=True)


# Rename detection
#
# The core problem: a renamed argument looks like one removal plus one additionz``
# A naive differ retires a working policy and raises a new work item for what is
# really the same thing. We score candidate pairs instead of comparing names only.

W_NAME, W_TYPE, W_DESC = 0.45, 0.30, 0.25


def ratio(a, b):
    return SequenceMatcher(None, a, b).ratio() if a and b else 0.0


def leaf(path):
    return path.rsplit(".", 1)[-1]


def parent(path):
    return path.rsplit(".", 1)[0] if "." in path else ""


def score_pair(removed_path, removed, added_path, added):
    """Score how likely `removed` was renamed to `added`. Returns (score, signals)"""
    if parent(removed_path) != parent(added_path):
        return 0.0, {}

    name_sim = ratio(leaf(removed_path), leaf(added_path))
    type_match = 1.0 if removed["type"] == added["type"] else 0.0
    desc_sim = ratio(removed["description"].lower(), added["description"].lower())

    score = W_NAME * name_sim + W_TYPE * type_match + W_DESC * desc_sim
    return score, {
        "name_similarity": round(name_sim, 3),
        "type_match": bool(type_match),
        "description_similarity": round(desc_sim, 3),
    }


def detect_renames(removed, added, threshold, review_band):
    """
    Returns (confident_renames, needs_review, still_removed, still_added)
    """
    candidates = []
    for rpath, rinfo in removed.items():
        for apath, ainfo in added.items():
            s, signals = score_pair(rpath, rinfo, apath, ainfo)
            if s > 0:
                candidates.append((s, rpath, apath, signals))
    candidates.sort(key=lambda c: -c[0])

    used_r, used_a = set(), set()
    confident, review = [], []
    for s, rpath, apath, signals in candidates:
        if rpath in used_r or apath in used_a:
            continue
        if s >= threshold:
            bucket = confident
        elif s >= review_band:
            bucket = review
        else:
            continue
        used_r.add(rpath)
        used_a.add(apath)
        bucket.append(
            {"from": rpath, "to": apath, "confidence": round(s, 3), "signals": signals}
        )

    still_removed = {k: v for k, v in removed.items() if k not in used_r}
    still_added = {k: v for k, v in added.items() if k not in used_a}
    return confident, review, still_removed, still_added


# Diffing


def diff_resource(old_args, new_args, threshold, review_band):
    removed = {k: v for k, v in old_args.items() if k not in new_args}
    added = {k: v for k, v in new_args.items() if k not in old_args}

    type_changed = []
    for k in old_args.keys() & new_args.keys():
        if old_args[k]["type"] != new_args[k]["type"]:
            type_changed.append(
                {"path": k, "from": old_args[k]["type"], "to": new_args[k]["type"]}
            )

    renames, review, still_removed, still_added = detect_renames(
        removed, added, threshold, review_band
    )

    unchanged = [
        k
        for k in old_args.keys() & new_args.keys()
        if old_args[k]["type"] == new_args[k]["type"]
    ]

    return {
        "unchanged": sorted(unchanged),
        "added": sorted(still_added),
        "removed": sorted(still_removed),
        "type_changed": sorted(type_changed, key=lambda d: d["path"]),
        "renamed": renames,
        "possible_renames": review,
    }


def build_changeset(old, new, from_label, to_label, threshold, review_band):
    resources_added = sorted(set(new) - set(old))
    resources_removed = sorted(set(old) - set(new))

    changed, unchanged_resources = {}, []
    for rname in sorted(set(old) & set(new)):
        d = diff_resource(old[rname], new[rname], threshold, review_band)
        if (
            d["added"]
            or d["removed"]
            or d["type_changed"]
            or d["renamed"]
            or d["possible_renames"]
        ):
            changed[rname] = d
        else:
            unchanged_resources.append(rname)

    return {
        "from_version": from_label,
        "to_version": to_label,
        "resource_totals": {
            "in_old": len(old),
            "in_new": len(new),
            "unchanged": len(unchanged_resources),
            "changed": len(changed),
            "added": len(resources_added),
            "removed": len(resources_removed),
        },
        "resources_added": resources_added,
        "resources_removed": resources_removed,
        "resources_unchanged": unchanged_resources,
        "resources_changed": changed,
    }

# Migration analysis
# Maps the changeset onto what it means for our policies

def analyse_migration(changeset, old, new):
    auto, auto_rename, retire, new_work, review = 0, 0, 0, 0, 0
    details = {"retire": [], "new_work": [], "renamed": [], "needs_review": []}

    for rname in changeset["resources_unchanged"]:
        auto += len(new[rname])

    for rname, d in changeset["resources_changed"].items():
        auto += len(d["unchanged"])
        auto_rename += len(d["renamed"])
        retire += len(d["removed"])
        new_work += len(d["added"])
        review += len(d["possible_renames"]) + len(d["type_changed"])

        details["renamed"] += [{"resource": rname, **r} for r in d["renamed"]]
        details["retire"] += [{"resource": rname, "path": p} for p in d["removed"]]
        details["new_work"] += [{"resource": rname, "path": p} for p in d["added"]]
        details["needs_review"] += [
            {"resource": rname, "reason": "possible rename", **r}
            for r in d["possible_renames"]
        ] + [
            {"resource": rname, "reason": "type changed", **t} for t in d["type_changed"]
        ]

    for rname in changeset["resources_removed"]:
        retire += len(old[rname])
        details["retire"] += [
            {"resource": rname, "path": p, "note": "resource removed"} for p in old[rname]
        ]

    for rname in changeset["resources_added"]:
        new_work += len(new[rname])

    existing = auto + auto_rename + retire + review
    migrated = auto + auto_rename
    pct = round(100.0 * migrated / existing, 1) if existing else 0.0

    return {
        "existing_policies_considered": existing,
        "carried_forward_unchanged": auto,
        "carried_forward_via_rename": auto_rename,
        "retired": retire,
        "needs_human_review": review,
        "new_work_items": new_work,
        "auto_migrate_percent": pct,
        "details": details,
    }

# Reporting


def write_report(changeset, analysis, path):
    t = changeset["resource_totals"]
    a = analysis
    L = []
    L.append(f"# Provider schema changeset: {changeset['from_version']} to {changeset['to_version']}\n")

    L.append("## Resource summary\n")
    L.append("| Metric | Count |")
    L.append(f"| Resources in {changeset['from_version']} | {t['in_old']} |")
    L.append(f"| Resources in {changeset['to_version']} | {t['in_new']} |")
    L.append(f"| Unchanged | {t['unchanged']} |")
    L.append(f"| Changed | {t['changed']} |")
    L.append(f"| Added | {t['added']} |")
    L.append(f"| Removed | {t['removed']} |\n")

    L.append("## Migration analysis\n")
    L.append(f"**{a['auto_migrate_percent']}% of existing policies migrate automatically.**\n")
    L.append("| Outcome | Policies |")
    L.append(f"| Carried forward, nothing changed | {a['carried_forward_unchanged']} |")
    L.append(f"| Carried forward via detected rename | {a['carried_forward_via_rename']} |")
    L.append(f"| Retired (argument or resource removed) | {a['retired']} |")
    L.append(f"| Needs a human to review | {a['needs_human_review']} |")
    L.append(f"| New work items (new arguments) | {a['new_work_items']} |")
    L.append(f"| **Existing policies considered** | **{a['existing_policies_considered']}** |\n")

    if a["details"]["renamed"]:
        L.append("## Detected renames (applied automatically after confirmation)\n")
        L.append("| Resource | From | To | Confidence | Name sim | Type match | Desc sim |")
        L.append("|---|---|---|---|---|---|---|")
        for r in a["details"]["renamed"]:
            s = r["signals"]
            L.append(
                f"| {r['resource']} | `{r['from']}` | `{r['to']}` | {r['confidence']} | "
                f"{s['name_similarity']} | {'yes' if s['type_match'] else 'no'} | {s['description_similarity']} |"
            )
        L.append("")

    if a["details"]["needs_review"]:
        L.append("## Needs human review\n")
        for r in a["details"]["needs_review"]:
            if r["reason"] == "possible rename":
                L.append(
                    f"- **{r['resource']}**: possible rename `{r['from']}` to `{r['to']}` "
                    f"(confidence {r['confidence']}) — confirm before applying."
                )
            else:
                L.append(
                    f"- **{r['resource']}**: type changed on `{r['path']}` "
                    f"({r['from']} to {r['to']}) — policy may need updating."
                )
        L.append("")

    if a["details"]["new_work"]:
        L.append("## New work items\n")
        for r in a["details"]["new_work"][:50]:
            L.append(f"- **{r['resource']}**: new argument `{r['path']}`")
        if len(a["details"]["new_work"]) > 50:
            L.append(f"- ...and {len(a['details']['new_work']) - 50} more")
        L.append("")

    if a["details"]["retire"]:
        L.append("## Policies to retire\n")
        for r in a["details"]["retire"][:50]:
            note = f" ({r['note']})" if r.get("note") else ""
            L.append(f"- **{r['resource']}**: `{r['path']}`{note}")
        if len(a["details"]["retire"]) > 50:
            L.append(f"- ...and {len(a['details']['retire']) - 50} more")
        L.append("")

    with open(path, "w") as fh:
        fh.write("\n".join(L))




def main():
    ap = argparse.ArgumentParser(description="Compare two Terraform provider schemas.")
    ap.add_argument("old_schema")
    ap.add_argument("new_schema")
    ap.add_argument("--provider", default="google")
    ap.add_argument("--from-label", default=None, help="label for the old version")
    ap.add_argument("--to-label", default=None, help="label for the new version")
    ap.add_argument("--out", default="differ_output", help="output directory")
    ap.add_argument("--rename-threshold", type=float, default=0.72,
                    help="score at or above this is treated as a confident rename")
    ap.add_argument("--review-threshold", type=float, default=0.55,
                    help="score at or above this is flagged for review")
    ap.add_argument("--only-resource", action="append", default=None,
                    help="limit to specific resource types")
    args = ap.parse_args()

    old = load_schema(args.old_schema, args.provider)
    new = load_schema(args.new_schema, args.provider)

    if args.only_resource:
        keep = set(args.only_resource)
        old = {k: v for k, v in old.items() if k in keep}
        new = {k: v for k, v in new.items() if k in keep}

    from_label = args.from_label or os.path.basename(args.old_schema)
    to_label = args.to_label or os.path.basename(args.new_schema)

    changeset = build_changeset(old, new, from_label, to_label,
                                args.rename_threshold, args.review_threshold)
    analysis = analyse_migration(changeset, old, new)

    os.makedirs(args.out, exist_ok=True)
    with open(os.path.join(args.out, "changeset.json"), "w") as fh:
        json.dump({"changeset": changeset, "migration_analysis": analysis}, fh, indent=2)
    write_report(changeset, analysis, os.path.join(args.out, "report.md"))

    print(f"{from_label} -> {to_label}")
    print(f"  resources: {changeset['resource_totals']['changed']} changed, "
          f"{changeset['resource_totals']['unchanged']} unchanged")
    print(f"  policies:  {analysis['auto_migrate_percent']}% migrate automatically "
          f"({analysis['carried_forward_unchanged']} unchanged + "
          f"{analysis['carried_forward_via_rename']} via rename)")
    print(f"  needs a human: {analysis['needs_human_review']}   "
          f"retired: {analysis['retired']}   new work: {analysis['new_work_items']}")
    print(f"  wrote {args.out}/changeset.json and {args.out}/report.md")


if __name__ == "__main__":
    main()
