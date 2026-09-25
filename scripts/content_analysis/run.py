#!/usr/bin/env python3
"""End-to-end content security analysis (standalone severity check).

Pipeline:
    plan.json -> extract -> analyze (bandit) -> normalize -> severity decision

Does NOT execute the extracted code — analysis is static only.

Severity thresholds are configurable; defaults:
    --fail-at MEDIUM   (MEDIUM or HIGH finding => FAIL)
    --warn-at LOW      (LOW or above finding => WARNING, when not FAIL)

Exit code is 1 when any resource is FAIL or ERROR, so this can act as a gate.

Usage:
    python3 scripts/content_analysis/run.py <plan.json>
"""
import argparse
import json
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))

import extract
import analyze
import normalize

SEVERITY_ORDER = {"LOW": 1, "MEDIUM": 2, "HIGH": 3}


def decide(findings, warn_at, fail_at):
    """Return (verdict, worst_severity) for a list of findings."""
    worst = None
    for f in findings:
        sev = f.get("severity")
        if sev in SEVERITY_ORDER and (
                worst is None or SEVERITY_ORDER[sev] > SEVERITY_ORDER[worst]):
            worst = sev

    if worst is None:
        return "PASS", "NONE"

    if fail_at and SEVERITY_ORDER.get(worst, 0) >= SEVERITY_ORDER.get(fail_at, 0):
        return "FAIL", worst
    if warn_at and SEVERITY_ORDER.get(worst, 0) >= SEVERITY_ORDER.get(warn_at, 0):
        return "WARNING", worst
    return "PASS", worst


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__,
                                     formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("plan_json", help="terraform show -json plan output")
    parser.add_argument("--registry", default=str(Path(__file__).parent / "registry.json"))
    parser.add_argument("--fail-at", default="MEDIUM",
                        help="severity at/above which to FAIL (default MEDIUM)")
    parser.add_argument("--warn-at", default="LOW",
                        help="severity at/above which to WARN (default LOW)")
    parser.add_argument("--output", "-o", help="write verdict JSON here (default: stdout)")
    args = parser.parse_args(argv)

    registry = extract.load_registry(args.registry)
    key_map = extract.attribute_key_map(registry)

    with open(args.plan_json, encoding="utf-8") as fh:
        plan = json.load(fh)

    snippets = extract.extract(plan, key_map)
    analyzed = analyze.analyze_snippets(snippets, registry)
    findings = normalize.normalize_all(analyzed)

    report = []
    for entry in findings:
        if "error" in entry:
            report.append({**entry, "verdict": "ERROR"})
            continue
        verdict, worst = decide(entry["findings"], args.warn_at, args.fail_at)
        report.append({**entry, "worst_severity": worst, "verdict": verdict})

    text = json.dumps(report, indent=2)
    if args.output:
        Path(args.output).write_text(text + "\n", encoding="utf-8")
    else:
        print(text)

    if any(r.get("verdict") in ("FAIL", "ERROR") for r in report):
        sys.exit(1)


if __name__ == "__main__":
    main()
