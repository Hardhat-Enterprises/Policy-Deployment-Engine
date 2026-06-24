#!/usr/bin/env python3
"""
Apply the APPROVED recommendations from the interactive assessment review.

Reads `review_recommendations.json` + `review_feedback.json` (repo root by default) and,
for every recommendation marked "approved", writes its `proposed_security_impact` /
`proposed_rationale` onto each occurrence's leaf in the corresponding docs_v2 file.

Rejected and undecided recommendations are skipped. Default is a dry run; pass --apply.
Run this BEFORE applying canonical assessments (canonical is authoritative on its keys).
"""

import argparse
import json
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent.parent.parent))
from scripts.docgen_v2.lib.logging_config import get_logger, setup_logging  # noqa: E402

logger = get_logger(__name__)


def main(argv=None) -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--recs", default="review_recommendations.json")
    ap.add_argument("--feedback", default="review_feedback.json")
    ap.add_argument("--docs", default="docs_v2/gcp")
    ap.add_argument("--apply", action="store_true")
    ap.add_argument("--silent", action="store_true")
    args = ap.parse_args(argv)
    setup_logging(silent=args.silent)

    recs = {r["id"]: r for r in json.loads(Path(args.recs).read_text(encoding="utf-8"))}
    feedback = json.loads(Path(args.feedback).read_text(encoding="utf-8"))
    approved = [recs[i] for i, d in feedback.items() if d.get("decision") == "approved" and i in recs]

    docs_root = Path(args.docs)
    edits = {}  # path -> list of (key, si, rationale)
    missing = 0
    for r in approved:
        for occ in r["occurrences"]:
            path = docs_root / r["service"] / f"{occ['resource']}.json"
            if not path.exists():
                logger.warning(f"missing file for {r['service']}/{occ['resource']}")
                missing += 1
                continue
            edits.setdefault(path, []).append(
                (occ["key"], r["proposed_security_impact"], r["proposed_rationale"]))

    applied_keys = 0
    for path, items in edits.items():
        doc = json.loads(path.read_text(encoding="utf-8"))
        argd = doc.get("arguments", {})
        for key, si, rationale in items:
            entry = argd.get(key)
            if not isinstance(entry, dict) or "security_impact" not in entry:
                continue
            entry["security_impact"] = si
            entry["rationale"] = rationale
            applied_keys += 1
        if args.apply:
            path.write_text(json.dumps(doc, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")

    logger.info(
        f"{'APPLIED' if args.apply else 'DRY-RUN'} | approved recs={len(approved)} | "
        f"files touched={len(edits)} | leaf edits={applied_keys} | missing files={missing}"
    )
    if not args.apply:
        logger.info("Dry run — re-run with --apply to write.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
