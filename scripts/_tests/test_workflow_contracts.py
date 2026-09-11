"""Contracts the two policy-check workflows must keep.

Not YAML style checks. Each one encodes a decision that was expensive to learn and
is invisible in the file itself:

* `policy_check_ALL` must always produce the `policy-results` artifact. The PDE
  Portal's dev-branch rollup consumes it newest-wins with no comparison to the
  commit being scanned, so when the whole-tree lint used to fail the job outright —
  taking the Terraform+OPA step and the upload down with it — the portal silently
  paired a fresh head sha with the last good verdicts for the two days of the
  #720 -> #750 window. The fix is two independent jobs, so neither can stop the
  other reporting.

* `policy_check_PR`'s structural lint must stay a hard gate. The portal bot polls
  `PR checks` and refuses to merge a raised pull request while it is red, so
  softening it there would quietly reopen the hole that let nine red pull requests
  reach dev.

The two lints look alike and are one `continue-on-error:` apart, which is exactly
why this is asserted rather than remembered.

Parsed by hand rather than with PyYAML: the repo declares no runtime dependencies
and CI installs only pytest, so a yaml import here would simply not run where it
matters most.
"""

import re
from pathlib import Path

import pytest

WORKFLOWS = Path(__file__).parent.parent.parent / ".github" / "workflows"
ALL_WORKFLOW = WORKFLOWS / "policy_check_ALL.yaml"
PR_WORKFLOW = WORKFLOWS / "policy_check_PR.yaml"

JOB_RE = re.compile(r"^  ([A-Za-z_][A-Za-z0-9_-]*):\s*$")
STEP_RE = re.compile(r"^      - (?:name: (.+?)|uses: (.+?))\s*$")


def jobs(path):
    """``{job name: {"body": text, "steps": {step name: text}}}``.

    Job keys are the 2-space-indented mappings under a top-level ``jobs:``; steps
    are ``- name:``/``- uses:`` at 6 spaces. Enough structure for the assertions
    here, and no dependency.
    """
    out, job, step = {}, None, None
    in_jobs = False
    for line in path.read_text(encoding="utf-8").splitlines():
        if line.startswith("jobs:"):
            in_jobs = True
            continue
        if not in_jobs:
            continue
        if line and not line.startswith(" ") and not line.startswith("#"):
            in_jobs = False           # a new top-level key ends the jobs block
            continue
        job_match = JOB_RE.match(line)
        if job_match:
            job, step = job_match.group(1), None
            out[job] = {"body": [], "steps": {}}
            continue
        if job is None:
            continue
        out[job]["body"].append(line)
        step_match = STEP_RE.match(line)
        if step_match:
            step = step_match.group(1) or step_match.group(2)
            out[job]["steps"][step] = []
            continue
        if step is not None:
            out[job]["steps"][step].append(line)
    return {
        name: {"body": "\n".join(data["body"]),
               "steps": {s: "\n".join(b) for s, b in data["steps"].items()}}
        for name, data in out.items()
    }


def has_line(body, text):
    """True when some line of ``body`` is exactly ``text`` (after stripping).

    Substring matching is not good enough for the artifact contract: `name:
    policy-results` is a prefix of `name: policy-results-v2`, so a rename would
    sail past an `in` check — which is precisely the change these assertions exist
    to catch.
    """
    return any(line.strip() == text for line in body.splitlines())


def step_of(path, job, name):
    parsed = jobs(path)
    assert job in parsed, f"{path.name} has no job {job!r} (renamed?): {list(parsed)}"
    found = parsed[job]["steps"]
    assert name in found, f"{path.name}:{job} has no step {name!r}: {list(found)}"
    return found[name]


# --------------------------------------------------------------------------- #
# policy_check_ALL: the artifact must survive a lint failure.
# --------------------------------------------------------------------------- #
def test_lint_and_policy_results_are_separate_jobs():
    parsed = jobs(ALL_WORKFLOW)
    assert "lint" in parsed and "policy_results" in parsed, (
        "the whole-tree lint and the Terraform+OPA run must be separate jobs, so a "
        "lint failure cannot stop the policy-results artifact being produced")


def test_policy_results_does_not_wait_on_the_lint():
    # A `needs: lint` would restore the exact coupling this split removes: the
    # artifact would stop being produced the moment the tree failed to lint.
    body = jobs(ALL_WORKFLOW)["policy_results"]["body"]
    assert "needs:" not in body, (
        "policy_results must not depend on the lint job — that dependency is the "
        "#720 -> #750 failure mode with extra steps")


def test_the_whole_tree_lint_still_fails_red():
    # Splitting must not turn into hiding: a broken tree still reddens the run.
    body = step_of(ALL_WORKFLOW, "lint", "Lint (whole tree, structural + content)")
    assert "continue-on-error" not in body, (
        "the lint job exists to go red honestly; it no longer needs softening "
        "because it no longer blocks anything")


def test_the_policy_run_and_its_upload_live_together():
    steps = jobs(ALL_WORKFLOW)["policy_results"]["steps"]
    assert "Run policy checks (Terraform + OPA)" in steps
    assert "Upload policy results artifact" in steps


def test_the_artifact_contract_the_portal_depends_on():
    # Names the portal matches on. Changing any of them silently breaks its dev
    # rollup, so they are spelled out here as much as documentation as assertion.
    body = step_of(ALL_WORKFLOW, "policy_results", "Upload policy results artifact")
    assert has_line(body, "name: policy-results"), \
        "the artifact name is what the portal fetches by; it may not be renamed"
    assert has_line(body, "path: policy_results.json"), \
        "the member filename is what the portal reads inside the artifact"
    assert has_line(body, "if: always()"), \
        "the upload must survive a failing policy run — the report is written first"


def test_the_policy_run_writes_the_report_the_upload_expects():
    assert "--report policy_results.json" in step_of(
        ALL_WORKFLOW, "policy_results", "Run policy checks (Terraform + OPA)")


def test_the_all_workflow_still_runs_on_dev_pushes():
    # The portal fetches from runs on dev; a trigger change would starve it.
    head = ALL_WORKFLOW.read_text(encoding="utf-8").split("jobs:")[0]
    assert "push:" in head and "- dev" in head


# --------------------------------------------------------------------------- #
# policy_check_PR: the gate must stay hard.
# --------------------------------------------------------------------------- #
@pytest.mark.parametrize("name", [
    "Structural lint (whole tree)",
    "Lint changed files (structural + content)",
    "Run the test suite",
])
def test_the_pr_gates_stay_hard(name):
    assert "continue-on-error" not in step_of(PR_WORKFLOW, "lint", name), (
        f"{name!r} must fail the job. The portal bot polls `PR checks` and refuses "
        "to merge while it is red; softening it reopens the hole that let nine red "
        "pull requests reach dev")


# --------------------------------------------------------------------------- #
# The line-endings detector is advisory, and dev-only.
# --------------------------------------------------------------------------- #
def test_the_line_ending_check_is_report_only():
    body = step_of(ALL_WORKFLOW, "lint", "Line endings (report only)")
    assert "continue-on-error: true" in body, (
        "a hard gate on line endings would be the exact failure it exists to catch "
        "— one CRLF file on dev would redden every pull request")


def test_the_line_ending_check_is_not_on_the_pr_workflow():
    for job in jobs(PR_WORKFLOW).values():
        assert not [s for s in job["steps"] if "Line endings" in s], \
            "the detector is dev-only by design"
