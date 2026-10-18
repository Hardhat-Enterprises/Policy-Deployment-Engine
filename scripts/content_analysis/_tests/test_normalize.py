"""Unit tests for scripts/content_analysis/normalize.py."""

import sys
from pathlib import Path

project_root = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(project_root))

from scripts.content_analysis import normalize


def test_normalize_bandit_maps_fields():
    raw = {"results": [
        {"test_id": "B602", "test_name": "subprocess_popen_with_shell_equals_true",
         "issue_severity": "HIGH", "issue_confidence": "HIGH",
         "issue_text": "subprocess call with shell=True", "line_number": 5},
    ]}
    assert normalize.normalize_bandit(raw) == [
        {"severity": "HIGH", "confidence": "HIGH", "rule_id": "B602",
         "test_name": "subprocess_popen_with_shell_equals_true",
         "message": "subprocess call with shell=True", "line": 5},
    ]


def test_normalize_bandit_no_results():
    assert normalize.normalize_bandit({"results": []}) == []


def test_normalize_all_preserves_errors():
    analyzed = [{"resource_type": "google_ces_agent", "error": "no analyzer"}]
    assert normalize.normalize_all(analyzed) == analyzed


def test_normalize_all_groups_findings():
    analyzed = [{
        "resource_type": "google_ces_agent", "resource_name": "r1",
        "attribute_path": ["after_agent_callbacks", 0, "python_code"],
        "language": "python", "tool": "bandit",
        "raw": {"results": [{"test_id": "B602", "issue_severity": "HIGH",
                              "issue_confidence": "HIGH", "issue_text": "m",
                              "test_name": "t", "line_number": 1}]},
    }]
    out = normalize.normalize_all(analyzed)
    assert out[0]["resource_name"] == "r1"
    assert out[0]["findings"][0]["rule_id"] == "B602"
    assert out[0]["findings"][0]["severity"] == "HIGH"
