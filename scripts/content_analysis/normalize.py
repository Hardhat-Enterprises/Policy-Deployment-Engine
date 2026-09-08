#!/usr/bin/env python3
"""Normalize raw analyzer (Bandit) output into the standard findings schema.

The standard schema is tool-agnostic so the Rego policy layer only has to
understand one shape, regardless of which analyzer produced the finding:
    findings[].{severity, confidence, rule_id, test_name, message, line}
"""
import argparse
import json
import sys
from pathlib import Path


def normalize_bandit(raw):
    """Map Bandit's ``results[]`` entries to the standard finding shape."""
    findings = []
    for r in raw.get("results", []):
        findings.append({
            "severity": r.get("issue_severity"),
            "confidence": r.get("issue_confidence"),
            "rule_id": r.get("test_id"),
            "test_name": r.get("test_name"),
            "message": r.get("issue_text"),
            "line": r.get("line_number"),
        })
    return findings


def normalize_all(analyzed):
    """Convert analyze.py output (list) into standard findings entries."""
    out = []
    for entry in analyzed:
        if "error" in entry:
            out.append({**entry})  # propagate errors verbatim
            continue
        out.append({
            "resource_type": entry["resource_type"],
            "resource_name": entry["resource_name"],
            "attribute_path": entry["attribute_path"],
            "language": entry["language"],
            "tool": entry["tool"],
            "findings": normalize_bandit(entry["raw"]),
        })
    return out


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("analyzed", help="JSON array from analyze.py")
    parser.add_argument("--output", "-o", help="write findings JSON here (default: stdout)")
    args = parser.parse_args(argv)

    analyzed = json.loads(Path(args.analyzed).read_text(encoding="utf-8"))
    findings = normalize_all(analyzed)

    text = json.dumps(findings, indent=2)
    if args.output:
        Path(args.output).write_text(text + "\n", encoding="utf-8")
    else:
        print(text)


if __name__ == "__main__":
    main()
