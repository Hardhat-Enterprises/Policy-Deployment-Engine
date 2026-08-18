#!/usr/bin/env python3
"""
Apply canonical (locked) assessments to all existing docs files.

Walks `docs/gcp/**/*.json` and overwrites the canonical cross-cutting keys
(data-residency `location`/`region`/`zone`, and IAM common keys) with the single
source-of-truth values from `scripts/docgen/lib/canonical.py`. New resources get the
same values directly from the generator, so this is only needed to update files that
already exist. Default dry run; pass --apply.
"""

import argparse
import json
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent.parent.parent))
from scripts.docgen.lib.logging_config import get_logger, setup_logging  # noqa: E402
from scripts.docgen.lib.canonical import apply_canonical  # noqa: E402

logger = get_logger(__name__)


def resource_name_from_path(path: Path) -> str:
    return path.name[:-5]  # strip .json; docs filenames are the full google_* type


def main(argv=None) -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--docs", default="docs/gcp")
    ap.add_argument("--apply", action="store_true")
    ap.add_argument("--silent", action="store_true")
    args = ap.parse_args(argv)
    setup_logging(silent=args.silent)

    docs_root = Path(args.docs)
    files_changed = 0
    keys_changed = 0
    for path in sorted(docs_root.rglob("*.json")):
        if any(part.startswith("_") for part in path.relative_to(docs_root).parts):
            continue  # skip _migration / _history
        doc = json.loads(path.read_text(encoding="utf-8"))
        if "arguments" not in doc:
            continue
        n = apply_canonical(resource_name_from_path(path), doc["arguments"])
        if n:
            files_changed += 1
            keys_changed += n
            if args.apply:
                path.write_text(json.dumps(doc, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")

    logger.info(
        f"{'APPLIED' if args.apply else 'DRY-RUN'} | files changed={files_changed} | "
        f"canonical keys overwritten={keys_changed}"
    )
    if not args.apply:
        logger.info("Dry run — re-run with --apply to write.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
