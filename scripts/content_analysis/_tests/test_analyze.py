"""Integration tests for scripts/content_analysis/analyze.py (requires Bandit).

Run with Bandit on PATH, e.g.:
    PATH="$PWD/.venv/bin:$PATH" python -m pytest scripts/content_analysis/
"""

import sys
from pathlib import Path

project_root = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(project_root))

from scripts.content_analysis import analyze


REGISTRY = {"content_types": [
    {"name": "python", "attribute_keys": ["python_code"],
     "analyzer": "bandit", "command": ["bandit", "-f", "json", "{file}"]}
]}


def _snippet(name, code):
    return {
        "resource_type": "google_ces_agent", "resource_name": name,
        "attribute_path": ["after_agent_callbacks", 0, "python_code"],
        "language": "python", "code": code,
    }


def test_analyze_secure_snippet_no_findings():
    results = analyze.analyze_snippets(
        [_snippet("secure_1", "def callback(event): return event")], REGISTRY)
    assert results[0]["raw"]["results"] == []


def test_analyze_vulnerable_snippet_finds_issues():
    code = "import subprocess\n\n\ndef run(user_input):\n    return subprocess.call(user_input, shell=True)\n"
    results = analyze.analyze_snippets([_snippet("vuln_1", code)], REGISTRY)
    rule_ids = {r["test_id"] for r in results[0]["raw"]["results"]}
    assert "B602" in rule_ids
    assert "B404" in rule_ids
    # The variable-command variant must register as HIGH (command injection).
    high = [r for r in results[0]["raw"]["results"] if r["test_id"] == "B602"]
    assert high and high[0]["issue_severity"] == "HIGH"
