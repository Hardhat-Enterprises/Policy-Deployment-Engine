#!/usr/bin/env python3
"""Run the configured static analyzer (Bandit) against extracted code snippets.

Never executes the code — each snippet is written to a temp ``.py`` file and
passed to ``bandit -f json`` (AST-based static analysis) only.
"""
import argparse
import json
import subprocess
import sys
import tempfile
from pathlib import Path


def load_registry(registry_path):
    with open(registry_path, encoding="utf-8") as fh:
        return json.load(fh)


def get_command(registry, language):
    """Return the analyzer command template for a language, or None."""
    for ct in registry.get("content_types", []):
        if ct.get("name") == language:
            return ct.get("command")
    return None


def run_bandit(command_template, code):
    """Write code to a temp file and run the analyzer command on it.

    Returns the parsed JSON output. Bandit exit codes: 0 = clean, 1 = findings,
    2 = error. Both 0 and 1 produce valid JSON on stdout.
    """
    with tempfile.NamedTemporaryFile("w", suffix=".py", encoding="utf-8", delete=False) as fh:
        fh.write(code)
        tmp_path = fh.name
    try:
        cmd = [part.replace("{file}", tmp_path) for part in command_template]
        proc = subprocess.run(cmd, capture_output=True, text=True)
        if proc.returncode not in (0, 1):
            raise RuntimeError(
                f"analyzer failed (rc={proc.returncode}): {proc.stderr[:500]}")
        try:
            return json.loads(proc.stdout)
        except json.JSONDecodeError as exc:
            raise RuntimeError(
                f"could not parse analyzer JSON: {exc}; stdout={proc.stdout[:300]}")
    finally:
        Path(tmp_path).unlink(missing_ok=True)


def analyze_snippets(snippets, registry):
    """Run the analyzer for each snippet; return raw per-snippet results."""
    results = []
    for snip in snippets:
        command = get_command(registry, snip["language"])
        if not command:
            results.append({**snip, "error": f"no analyzer for language '{snip['language']}'"})
            continue
        try:
            raw = run_bandit(command, snip["code"])
        except RuntimeError as exc:
            results.append({**snip, "error": str(exc)})
            continue
        results.append({
            "resource_type": snip["resource_type"],
            "resource_name": snip["resource_name"],
            "attribute_path": snip["attribute_path"],
            "language": snip["language"],
            "tool": "bandit",
            "raw": raw,
        })
    return results


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--snippets", help="JSON array from extract.py (default: stdin)")
    parser.add_argument("--registry", default=str(Path(__file__).parent / "registry.json"))
    parser.add_argument("--output", "-o", help="write results JSON here (default: stdout)")
    args = parser.parse_args(argv)

    if args.snippets:
        raw = Path(args.snippets).read_text(encoding="utf-8")
    else:
        raw = sys.stdin.read()
    snippets = json.loads(raw)

    results = analyze_snippets(snippets, load_registry(args.registry))

    text = json.dumps(results, indent=2)
    if args.output:
        Path(args.output).write_text(text + "\n", encoding="utf-8")
    else:
        print(text)


if __name__ == "__main__":
    main()
