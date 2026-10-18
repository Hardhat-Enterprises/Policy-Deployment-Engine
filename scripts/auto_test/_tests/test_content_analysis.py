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


def test_needs_content_analysis_ignores_bare_phrase_elsewhere(tmp_path):
    # The gate keys on the exact policy_type field, not the phrase: a mention of
    # "content security" in a description must not trigger the analysis.
    policy = tmp_path / "p.rego"
    policy.write_text('"situation_description": "checks content security"\n', encoding="utf-8")
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


@pytest.mark.skipif(not shutil.which("bandit") or not shutil.which("opa"),
                    reason="needs Bandit and OPA")
@pytest.mark.parametrize("outcome", ["success", "opa_error", "undefined"])
def test_content_analysis_in_argument_layout_preserves_plan_and_cleans_copy(
        tmp_path, monkeypatch, outcome):
    resource = "google_ces_agent"
    argument = "after_agent_callbacks.python_code"
    directory = tmp_path / "policies/gcp/Customer Engagement Suite" / resource / argument
    directory.mkdir(parents=True)
    (tmp_path / "policies/gcp/config.tf").write_text("# shared config\n")
    for name in auto_test.FIXTURE_TF_FILES:
        (directory / name).write_text("# cached synthetic fixture\n")
    policy = directory / "policy.rego"
    policy.write_text('''package terraform.gcp.security.test.google_ces_agent.callback
import data.terraform.helpers
import data.terraform.gcp.security.test.google_ces_agent.vars
conditions := [[
    {"situation_description": "Unsafe callback", "remedies": ["Fix the code"]},
    {"condition": "Safe code", "attribute_path": ["after_agent_callbacks", 0, "python_code"],
     "values": ["MEDIUM"], "policy_type": "content security"}
]]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
''')
    (directory.parent / "_vars.rego").write_text('''package terraform.gcp.security.test.google_ces_agent.vars
variables := {"resource_type": "google_ces_agent", "resource_value_name": "name",
              "friendly_resource_name": "Agent"}
''')
    resources = []
    for name, code in [
        ("compliant_example_1", "def callback():\n    return 1\n"),
        ("non_compliant_example_1", "import subprocess\nsubprocess.call(input(), shell=True)\n"),
    ]:
        resources.append({"type": resource, "name": name, "values": {
            "name": name, "after_agent_callbacks": [{"python_code": code}]}})
    cache = auto_test.plan_cache_path(directory)
    cache.write_text(json.dumps({"planned_values": {"root_module": {"resources": resources}}}))
    before = {p.name: p.read_bytes() for p in directory.iterdir()}
    copies = []
    inject = auto_test.inject_content_security_findings

    def track_copy(path):
        result = inject(path)
        assert result is not None
        copies.append(result)
        return result

    monkeypatch.setattr(auto_test, "inject_content_security_findings", track_copy)
    if outcome != "success":
        evaluate = auto_test.opa_eval_value

        def message_result(paths, plan, query):
            if query.endswith(".message"):
                if outcome == "opa_error":
                    raise auto_test.OpaEvalError("simulated evaluation failure")
                return None
            return evaluate(paths, plan, query)

        monkeypatch.setattr(auto_test, "opa_eval_value", message_result)
    result = auto_test.run_policy_check_pair(
        directory, policy, project_root / "policies", cache)
    assert result["passed"] is (outcome == "success"), json.dumps(result, indent=2)
    assert result["policy"] == argument
    if outcome != "success":
        assert result["failure"]["file"].endswith(f"{argument}/policy.rego")
        reason = result["failure"]["reason"]
        assert ("opa eval failed" if outcome == "opa_error" else "message rule is undefined") in reason
    assert copies and all(not path.exists() for path in copies)
    assert {p.name: p.read_bytes() for p in directory.iterdir()} == before
