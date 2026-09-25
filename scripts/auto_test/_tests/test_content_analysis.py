"""Unit tests for the content-security integration in auto_test.py."""

import json
import shutil
import sys
from pathlib import Path

import pytest

project_root = Path(__file__).parent.parent.parent.parent
sys.path.insert(0, str(project_root))

from scripts.auto_test import auto_test


def test_needs_content_analysis_true_for_content_security(tmp_path):
    policy = tmp_path / "p.rego"
    policy.write_text('"policy_type": "content security"\n', encoding="utf-8")
    assert auto_test.needs_content_analysis(policy) is True


@pytest.mark.parametrize("policy_type", ["whitelist", "blacklist", "range", "map key blacklist"])
def test_needs_content_analysis_false_for_other_types(tmp_path, policy_type):
    policy = tmp_path / "p.rego"
    policy.write_text(f'"policy_type": "{policy_type}"\n', encoding="utf-8")
    assert auto_test.needs_content_analysis(policy) is False


def test_inject_content_security_findings_returns_none_without_bandit(tmp_path, monkeypatch):
    plan = tmp_path / "plan.json"
    plan.write_text("{}", encoding="utf-8")
    monkeypatch.setattr(auto_test.shutil, "which", lambda _: None)
    assert auto_test.inject_content_security_findings(plan) is None


@pytest.mark.skipif(shutil.which("bandit") is None, reason="bandit not installed")
def test_inject_content_security_findings_injects_findings(tmp_path):
    plan = tmp_path / "plan.json"
    plan.write_text(json.dumps({
        "planned_values": {"root_module": {"resources": [
            {
                "type": "google_ces_agent",
                "name": "non_compliant_example_1",
                "values": {"after_agent_callbacks": [
                    {"python_code": "import subprocess\nsubprocess.call('x', shell=True)"}
                ]},
            }
        ]}},
    }), encoding="utf-8")

    augmented = auto_test.inject_content_security_findings(plan)
    assert augmented is not None
    try:
        data = json.loads(augmented.read_text(encoding="utf-8"))
        findings = data.get("content_security_findings", [])
        names = {entry.get("resource_name") for entry in findings}
        assert "non_compliant_example_1" in names
    finally:
        augmented.unlink(missing_ok=True)
