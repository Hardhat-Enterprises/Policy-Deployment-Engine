#!/usr/bin/env python3
"""
Migrate hand-authored security assessments from the legacy ``docs/gcp`` tree onto the
spec-conformant ``docs_v2/gcp`` tree produced by docgen_v3.

What carries: ``security_impact`` (as a JSON boolean) and ``rationale`` (non-empty
string). Everything else in the legacy files (``compliant``/``non-compliant``/``parent``,
descriptions) is intentionally ignored — docs_v2 owns those.

Matching (per the agreed rules):
  - Resource: legacy ``<type>`` matches docs_v2 ``google_<type>``. A legacy single
    ``<x>_iam`` file maps onto the split ``<x>_iam_{binding,member,policy}`` resources
    (the args are identical across IAM variants), applying each arg to whichever split
    files contain it. Resources with no docs_v2 counterpart are dropped + reported.
  - Argument: exact dotted-key match first; else a leaf-name match **only when that leaf
    name is unique** in the resource; on any clash/ambiguity → abandon + report.
  - ``security_impact``: real booleans carry; ``"true"``/``"false"`` strings are coerced;
    every other string is dropped (reported). A non-empty rationale still carries.

Default is a dry run (writes only the report). Pass ``--apply`` to update docs_v2 files.
"""

import argparse
import json
import sys
from collections import Counter, defaultdict
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent.parent.parent))

from scripts.docgen_v2.lib.logging_config import get_logger, setup_logging  # noqa: E402

logger = get_logger(__name__)

GOOGLE_PREFIX = "google_"
IAM_SPLIT_SUFFIXES = ("_binding", "_member", "_policy")


# --- helpers ---------------------------------------------------------------

def norm_type(stem: str) -> str:
    """Filename stem -> canonical resource type (drop .template and google_ prefix)."""
    if stem.endswith(".template"):
        stem = stem[: -len(".template")]
    return stem[len(GOOGLE_PREFIX):] if stem.startswith(GOOGLE_PREFIX) else stem


def resource_type_from_path(path: Path) -> str:
    name = path.name
    if name.endswith(".json"):
        name = name[:-5]
    return norm_type(name)


def split_slash_paths(dotted: str):
    """Expand a key with slash-combined names into all concrete paths.

    ``a.member/members.b`` -> ``["a.member.b", "a.members.b"]``
    """
    out = [""]
    for segment in dotted.split("."):
        choices = segment.split("/")
        out = [(p + "." + c if p else c) for p in out for c in choices]
    return out


def flatten_old(arguments: dict, prefix: str = "") -> dict:
    """Legacy nested ``arguments`` -> ``{dotted_key: (security_impact, rationale)}``."""
    out = {}
    for name, arg in (arguments or {}).items():
        if not isinstance(arg, dict):
            continue
        key = prefix + name
        out[key] = (arg.get("security_impact"), arg.get("rationale"))
        nested = arg.get("arguments")
        if isinstance(nested, dict):
            out.update(flatten_old(nested, key + "."))
    return out


def coerce_security_impact(value):
    """Return ('bool', True/False) | ('nonbool', original) | ('none', None)."""
    if isinstance(value, bool):
        return ("bool", value)
    if isinstance(value, str):
        s = value.strip().lower()
        if s == "true":
            return ("bool", True)
        if s == "false":
            return ("bool", False)
        return ("nonbool", value)
    return ("none", None)


def _is_internal(rel: Path) -> bool:
    return any(part.startswith("_") for part in rel.parts)


def build_v2_index(new_dir: Path) -> dict:
    """resource_type -> {path, leaves(set of dotted leaf keys), leafname(name->[keys])}."""
    index = {}
    for f in sorted(new_dir.rglob("*.json")):
        if _is_internal(f.relative_to(new_dir)):
            continue
        try:
            doc = json.loads(f.read_text(encoding="utf-8"))
        except Exception as e:  # noqa: BLE001
            logger.warning(f"Skipping unreadable docs_v2 file {f}: {e}")
            continue
        leaves = {
            k for k, v in doc.get("arguments", {}).items()
            if isinstance(v, dict) and "security_impact" in v
        }
        leafname = defaultdict(list)
        for k in leaves:
            leafname[k.rsplit(".", 1)[-1]].append(k)
        index[resource_type_from_path(f)] = {"path": f, "leaves": leaves, "leafname": leafname}
    return index


def candidate_types(rtype: str, v2_index: dict):
    """docs_v2 resource types a legacy resource maps onto (handles IAM split)."""
    if rtype in v2_index:
        return [rtype]
    if rtype.endswith("_iam"):
        return [rtype + suf for suf in IAM_SPLIT_SUFFIXES if (rtype + suf) in v2_index]
    return []


def resolve(key: str, entry: dict):
    """('exact', key) | ('fallback', dotted) | ('ambiguous', None) | ('missing', None)."""
    if key in entry["leaves"]:
        return ("exact", key)
    cands = entry["leafname"].get(key.rsplit(".", 1)[-1], [])
    if len(cands) == 1:
        return ("fallback", cands[0])
    if len(cands) > 1:
        return ("ambiguous", None)
    return ("missing", None)


# --- migration core --------------------------------------------------------

class Migration:
    def __init__(self, old_dir: Path, new_dir: Path):
        self.old_dir = old_dir
        self.new_dir = new_dir
        self.v2 = build_v2_index(new_dir)
        # docs_v2 path -> list of (target_key, security_impact|None, rationale|None)
        self.carries = defaultdict(list)
        self.stats = Counter()
        self.dropped_resources = []   # (rtype, n_assessments)
        self.dropped_args = []        # (rtype, old_key, reason, security_impact, rationale)
        self.parse_errors = []        # (rel_path, error)

    def run(self):
        for f in sorted(self.old_dir.rglob("*.json")):
            rel = f.relative_to(self.old_dir)
            if _is_internal(rel):
                continue
            try:
                doc = json.loads(f.read_text(encoding="utf-8-sig"))
            except Exception as e:  # noqa: BLE001
                self.parse_errors.append((str(rel), str(e)))
                self.stats["parse_error"] += 1
                continue
            self._process_file(f, doc)
        return self

    def _process_file(self, path: Path, doc: dict):
        rtype = resource_type_from_path(path)
        flat = flatten_old(doc.get("arguments", {}))
        candidates = candidate_types(rtype, self.v2)

        # Build the set of assessed legacy args (carryable bool/rationale, or nonbool to report).
        assessed = {}
        for key, (si, rat) in flat.items():
            kind, val = coerce_security_impact(si)
            rationale = rat if (isinstance(rat, str) and rat.strip()) else None
            if kind == "bool" or rationale or kind == "nonbool":
                assessed[key] = (kind, val, rationale, si)

        if not candidates:
            n = sum(1 for _, (kind, _, rat, _) in assessed.items() if kind == "bool" or rat)
            if n:
                self.dropped_resources.append((rtype, n))
                self.stats["dropped_resource_missing"] += n
            return

        for old_key, (kind, si_val, rationale, si_orig) in assessed.items():
            carry_si = si_val if kind == "bool" else None
            if kind == "nonbool":
                # the non-boolean security_impact string is dropped either way
                self.dropped_args.append((rtype, old_key, "nonbool_string", si_orig, None))
                self.stats["dropped_nonbool_string"] += 1
            if carry_si is None and not rationale:
                continue  # nothing carryable left for this arg

            placed = self._place(old_key, carry_si, rationale, candidates)
            if not placed:
                reason = self._unmatched_reason(old_key, candidates)
                self.dropped_args.append((rtype, old_key, reason, si_orig, rationale))
                self.stats[f"dropped_{reason}"] += 1

    def _place(self, old_key, carry_si, rationale, candidates) -> bool:
        """Apply an assessment to every candidate docs_v2 resource that has the arg."""
        placed = False
        variants = split_slash_paths(old_key)
        for ctype in candidates:
            entry = self.v2[ctype]
            for var in variants:
                kind, target = resolve(var, entry)
                if kind in ("exact", "fallback"):
                    self.carries[entry["path"]].append((target, carry_si, rationale))
                    self.stats[f"placements_{kind}"] += 1
                    placed = True
        if placed:
            self.stats["source_args_carried"] += 1
        return placed

    def _unmatched_reason(self, old_key, candidates) -> str:
        variants = split_slash_paths(old_key)
        for ctype in candidates:
            for var in variants:
                if resolve(var, self.v2[ctype])[0] == "ambiguous":
                    return "ambiguous"
        return "arg_unmatched"

    def apply(self):
        """Write carried assessments into docs_v2 files (preserving structure/order)."""
        for path, items in self.carries.items():
            doc = json.loads(path.read_text(encoding="utf-8"))
            args = doc.get("arguments", {})
            for target, si_val, rationale in items:
                entry = args.get(target)
                if not isinstance(entry, dict) or "security_impact" not in entry:
                    continue  # never write onto a block or missing key
                if si_val is not None:
                    entry["security_impact"] = si_val
                if rationale:
                    entry["rationale"] = rationale
            path.write_text(json.dumps(doc, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
        logger.info(f"Applied assessments to {len(self.carries)} docs_v2 files")

    # --- report ---

    def report_markdown(self) -> str:
        s = self.stats
        files_touched = len(self.carries)
        lines = [
            "# Legacy assessment migration report",
            "",
            f"- Source: `{self.old_dir}`  →  Target: `{self.new_dir}`",
            "",
            "## Summary",
            "",
            f"- Source args carried (≥1 placement): **{s['source_args_carried']}**",
            f"  - placements by exact dotted-key match: {s['placements_exact']}",
            f"  - placements by unique leaf-name fallback: {s['placements_fallback']}",
            f"  - docs_v2 files updated: {files_touched}",
            "- Dropped:",
            f"  - assessments in resources absent from docs_v2: {s['dropped_resource_missing']}",
            f"  - args unmatched in a matched resource (renamed/removed/now-block): {s['dropped_arg_unmatched']}",
            f"  - args with leaf-name clash (ambiguous): {s['dropped_ambiguous']}",
            f"  - non-boolean `security_impact` strings dropped: {s['dropped_nonbool_string']}",
            f"  - legacy files that failed to parse: {s['parse_error']}",
            "",
            "## Resources absent from docs_v2 (whole-file dropped)",
            "",
        ]
        for rtype, n in sorted(self.dropped_resources):
            lines.append(f"- `{rtype}` — {n} assessment(s)")
        lines += ["", "## Dropped arguments in matched resources", ""]
        by_res = defaultdict(list)
        for rtype, key, reason, si, rat in self.dropped_args:
            by_res[rtype].append((key, reason, si, rat))
        for rtype in sorted(by_res):
            lines.append(f"### `{rtype}`")
            for key, reason, si, rat in sorted(by_res[rtype]):
                detail = f"security_impact={si!r}"
                if rat:
                    detail += f", rationale={rat[:80]!r}"
                lines.append(f"- `{key}` — {reason} ({detail})")
            lines.append("")
        if self.parse_errors:
            lines += ["## Parse errors", ""]
            for rel, err in self.parse_errors:
                lines.append(f"- `{rel}` — {err}")
            lines.append("")
        return "\n".join(lines)


def main(argv=None) -> int:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--old-dir", default="docs/gcp", help="Legacy docs root (default: docs/gcp)")
    parser.add_argument("--new-dir", default="docs_v2/gcp", help="docs_v2 root (default: docs_v2/gcp)")
    parser.add_argument("--report", default="docs_v2/gcp/_migration/report.md",
                        help="Report output path")
    parser.add_argument("--apply", action="store_true",
                        help="Write changes to docs_v2 (default: dry-run, report only)")
    parser.add_argument("--silent", action="store_true")
    args = parser.parse_args(argv)
    setup_logging(silent=args.silent)

    migration = Migration(Path(args.old_dir), Path(args.new_dir)).run()

    report_path = Path(args.report)
    report_path.parent.mkdir(parents=True, exist_ok=True)
    report_path.write_text(migration.report_markdown(), encoding="utf-8")
    logger.info(f"Report written to {report_path}")

    if args.apply:
        migration.apply()
    else:
        logger.info("Dry run (no docs_v2 files modified). Re-run with --apply to write.")

    s = migration.stats
    logger.info(
        f"{'APPLIED' if args.apply else 'DRY-RUN'} | carried={s['source_args_carried']} "
        f"(exact={s['placements_exact']} fallback={s['placements_fallback']}) | "
        f"dropped: resource_missing={s['dropped_resource_missing']} "
        f"arg_unmatched={s['dropped_arg_unmatched']} ambiguous={s['dropped_ambiguous']} "
        f"nonbool={s['dropped_nonbool_string']} parse_errors={s['parse_error']}"
    )
    return 0


if __name__ == "__main__":
    sys.exit(main())
