"""A failed check must say why, in the reason itself.

The reason is what reaches the step summary, the CI annotation and the
policy_results.json report; the log is only for whoever opens it. It used to be
"Terraform failed to compile!" with the error printed only under --verbose (the
Engine check runs without it), and "Could not run OPA query!" for both an opa
error and a policy whose message rule was simply undefined.
"""

import json
import shutil
import subprocess
import sys
from pathlib import Path

import pytest

project_root = Path(__file__).parent.parent.parent.parent
sys.path.insert(0, str(project_root))

from scripts.auto_test import auto_test  # noqa: E402

TERRAFORM_ERROR = """\
╷
│ Error: Argument or block definition required
│
│   on main.tf line 1:
│    1: this is not terraform
│
│ An argument or block definition is required here.
╵
"""


def _pair(tmp_path, tf="this is not terraform\n"):
    """An inputs/.../<arg>/ fixture and its policies/.../<arg>.rego, repo-shaped."""
    fixture = tmp_path / "inputs" / "gcp" / "Svc" / "google_x" / "location"
    fixture.mkdir(parents=True)
    (fixture / "main.tf").write_text(tf)
    policy_dir = tmp_path / "policies" / "gcp" / "Svc" / "google_x"
    policy_dir.mkdir(parents=True)
    policy = policy_dir / "location.rego"
    policy.write_text("package terraform.gcp.security.svc.google_x.location\n")
    return fixture, policy


def _check(fixture, policy, tmp_path, verbose=False):
    return auto_test.run_policy_check_pair(
        fixture, policy, tmp_path / "policies", auto_test.plan_cache_path(fixture), verbose)


# --------------------------------------------------------------------------- #
# Terraform
# --------------------------------------------------------------------------- #
@pytest.mark.parametrize("verbose", [False, True])
def test_a_terraform_failure_carries_the_fixture_the_command_and_the_error(
        tmp_path, monkeypatch, verbose):
    fixture, policy = _pair(tmp_path)

    def fake_run(cmd, **kwargs):
        return subprocess.CompletedProcess(cmd, 1, stdout="", stderr=TERRAFORM_ERROR)
    monkeypatch.setattr(auto_test.subprocess, "run", fake_run)

    result = _check(fixture, policy, tmp_path, verbose)
    reason = result["failure"]["reason"]
    assert result["passed"] is False
    assert reason.startswith("terraform init failed for ")
    assert "inputs/gcp/Svc/google_x/location" in reason
    assert "Error: Argument or block definition required" in reason
    assert "on main.tf line 1" in reason
    assert result["failure"]["file"].endswith("inputs/gcp/Svc/google_x/location")


@pytest.mark.skipif(not shutil.which("terraform"), reason="terraform not installed")
@pytest.mark.parametrize("verbose", [False, True])
def test_a_broken_fixture_fails_with_terraforms_own_error(tmp_path, verbose):
    # The real thing: a syntax error fails `terraform init` before any provider is
    # needed, so this runs offline.
    fixture, policy = _pair(tmp_path)
    reason = _check(fixture, policy, tmp_path, verbose)["failure"]["reason"]
    assert "inputs/gcp/Svc/google_x/location" in reason
    assert "Error:" in reason
    assert "\x1b[" not in reason                 # -no-color: no ANSI in annotations


def test_the_quoted_output_starts_at_the_error_and_is_bounded():
    noise = "\n".join(f"Initializing thing {i}" for i in range(50))
    head = auto_test.output_head(noise + "\n" + TERRAFORM_ERROR + "\n".join(["x"] * 50))
    assert head.startswith("│ Error: Argument or block definition required")
    assert len(head.splitlines()) == auto_test.OUTPUT_HEAD_LINES
    assert auto_test.output_head("") == "(no output)"


# --------------------------------------------------------------------------- #
# OPA
# --------------------------------------------------------------------------- #
VARIABLES = {"resource_type": "google_x", "resource_value_name": "name"}


def _opa_answers(monkeypatch, message):
    """opa_eval_value answering the vars query, then the message query with ``message``
    (an exception is raised instead of returned)."""
    answers = iter([VARIABLES, message])

    def fake(data_paths, plan, query):
        value = next(answers)
        if isinstance(value, Exception):
            raise value
        return value
    monkeypatch.setattr(auto_test, "opa_eval_value", fake)


@pytest.fixture
def cached_pair(tmp_path):
    fixture, policy = _pair(tmp_path, 'resource "google_x" "non_compliant_example_1" {}\n')
    auto_test.plan_cache_path(fixture).write_text(json.dumps({"planned_values": {"root_module": {
        "resources": [{"type": "google_x", "name": "non_compliant_example_1", "values": {}}]}}}))
    return fixture, policy


def test_an_undefined_message_rule_names_the_package(cached_pair, tmp_path, monkeypatch):
    _opa_answers(monkeypatch, None)
    result = _check(*cached_pair, tmp_path)
    assert result["failure"]["reason"] == (
        "policy's message rule is undefined (check the package name "
        "terraform.gcp.security.svc.google_x.location)")
    assert result["failure"]["file"].endswith("policies/gcp/Svc/google_x/location.rego")


def test_an_opa_error_is_reported_as_one(cached_pair, tmp_path, monkeypatch):
    _opa_answers(monkeypatch, auto_test.OpaEvalError("1 error occurred: rego_parse_error"))
    reason = _check(*cached_pair, tmp_path)["failure"]["reason"]
    assert reason == "opa eval failed: 1 error occurred: rego_parse_error"


def test_an_empty_message_is_judged_like_any_other(cached_pair, tmp_path, monkeypatch):
    # Defined but empty: the policy ran and flagged nothing, which is a verdict,
    # not an error — so the fixture's unflagged non-compliant example is the reason.
    _opa_answers(monkeypatch, [])
    reason = _check(*cached_pair, tmp_path)["failure"]["reason"]
    assert reason == "Non-compliant resources were not flagged: non_compliant_example_1"


@pytest.mark.skipif(not shutil.which("opa"), reason="opa not installed")
def test_opa_itself_tells_undefined_from_broken(tmp_path):
    plan = tmp_path / "plan.json"
    plan.write_text("{}")
    good = tmp_path / "good"
    good.mkdir()
    (good / "p.rego").write_text("package right.name\n\nmessage := [\"hi\"]\n")
    assert auto_test.opa_eval_value(good, plan, "data.right.name.message") == ["hi"]
    # A wrong package name: opa runs fine and the rule is simply undefined.
    assert auto_test.opa_eval_value(good, plan, "data.wrong.name.message") is None

    broken = tmp_path / "broken"
    broken.mkdir()
    (broken / "p.rego").write_text("package right.name\n\nmessage := [\n")
    with pytest.raises(auto_test.OpaEvalError, match="rego_parse_error"):
        auto_test.opa_eval_value(broken, plan, "data.right.name.message")


# --------------------------------------------------------------------------- #
# GitHub Actions output
# --------------------------------------------------------------------------- #
FAILURE = auto_test.make_failure(
    "location", "terraform plan failed for inputs/x:\nError: 100% broken, a:b",
    "Svc", "google_x", file=project_root / "inputs/gcp/Svc/google_x/location")


def test_a_failure_becomes_an_annotation_and_a_summary_row(tmp_path, capsys):
    summary = tmp_path / "summary.md"
    env = {"GITHUB_ACTIONS": "true", "GITHUB_STEP_SUMMARY": str(summary)}
    auto_test.report_failures_to_github([FAILURE], env)
    assert capsys.readouterr().out.strip() == (
        "::error file=inputs/gcp/Svc/google_x/location,title=google_x/location::"
        "terraform plan failed for inputs/x:%0AError: 100%25 broken, a:b")
    table = summary.read_text()
    assert "| google_x | location | `inputs/gcp/Svc/google_x/location` |" in table
    assert "inputs/x:<br>Error: 100% broken" in table


def test_nothing_is_emitted_outside_actions(tmp_path, capsys):
    auto_test.report_failures_to_github([FAILURE], {"GITHUB_STEP_SUMMARY": str(tmp_path / "s")})
    assert capsys.readouterr().out == ""
    assert not (tmp_path / "s").exists()


def test_a_table_cell_cannot_break_the_table():
    assert auto_test._cell("a | b\n<c>") == "a \\| b<br>&lt;c&gt;"


# --------------------------------------------------------------------------- #
# A run with nothing to test
# --------------------------------------------------------------------------- #
def test_an_empty_run_names_where_it_looked(tmp_path, monkeypatch, capsys):
    monkeypatch.chdir(tmp_path)
    monkeypatch.setattr(sys, "argv", ["auto_test.py", "--inputs", "inputs/gcp/A/r",
                                      "--policies", "policies/gcp/A/r"])
    with pytest.raises(SystemExit) as exit_info:
        auto_test.main()
    assert exit_info.value.code == 1
    out = capsys.readouterr().out
    assert "inputs/gcp/A/r" in out and "policies/gcp/A/r" in out
