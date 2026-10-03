"""The branch_scope recovery recipe, run for real against a throwaway git repo.

test_branch_scope.py checks what the recipe *says*; these check that doing
exactly what it says makes the check pass. The case they were written for is a
branch that is merely behind: the contributor stray-edits another resource's
file, dev then changes the same file, and a restore from ``origin/dev`` leaves
the file different from the merge-base the check compares against — so the
finding stays until the contributor merges dev, which nothing on screen told
them to do.

Each test builds a repo with a ``dev`` branch and an ``origin/dev`` ref, runs
branch_scope.py on a Service/ branch, runs every git command from the printed
recipe except ``git push``, and runs the check again.
"""

import os
import shutil
import subprocess
import sys
from pathlib import Path

import pytest

SCRIPT = Path(__file__).resolve().parent.parent / "branch_scope.py"

BRANCH = "Service/gcp/cloud_storage/google_storage_bucket"
OWN = "inputs/gcp/Cloud Storage/google_storage_bucket"
SIBLING_POLICY = "policies/gcp/Cloud Storage/google_storage_hmac_key/foo.rego"
SIBLING_INPUTS = "inputs/gcp/Cloud Storage/google_storage_hmac_key"

pytestmark = pytest.mark.skipif(
    shutil.which("git") is None or shutil.which("bash") is None,
    reason="needs git and bash to run the printed recipe")


def _git(repo, *args):
    return subprocess.run(["git", *args], cwd=repo, check=True,
                          capture_output=True, text=True).stdout


def _write(repo, path, text):
    target = repo / path
    target.parent.mkdir(parents=True, exist_ok=True)
    target.write_text(text)


def _commit(repo, message):
    _git(repo, "add", "-A")
    _git(repo, "commit", "-q", "-m", message)


@pytest.fixture
def repo(tmp_path):
    """dev@X with our resource's docs JSON and a sibling resource's kit."""
    repo = tmp_path / "repo"
    repo.mkdir()
    _git(repo, "init", "-q", "-b", "dev")
    _git(repo, "config", "user.name", "test")
    _git(repo, "config", "user.email", "test@example.com")
    _git(repo, "config", "commit.gpgsign", "false")
    _write(repo, "docs/gcp/Cloud Storage/google_storage_bucket.json", "{}\n")
    _write(repo, "docs/gcp/Cloud Storage/google_storage_hmac_key.json", "{}\n")
    _write(repo, SIBLING_POLICY, "package foo\n")
    _write(repo, f"{SIBLING_INPUTS}/foo/compliant.tf", "# v1\n")
    _write(repo, f"{SIBLING_INPUTS}/foo/noncompliant.tf", "# v1\n")
    _write(repo, "scripts/tool.py", "# v1\n")
    _write(repo, "README.md", "v1\n")
    _commit(repo, "X")
    _git(repo, "checkout", "-q", "-b", BRANCH)
    _write(repo, f"{OWN}/location/compliant.tf", "# mine\n")
    _commit(repo, "own work")
    return repo


def _advance_dev(repo, path, text):
    """Commit ``path`` on dev, point origin/dev at it, and return to the branch."""
    _git(repo, "checkout", "-q", "dev")
    _write(repo, path, text)
    _commit(repo, f"dev changes {path}")
    _git(repo, "update-ref", "refs/remotes/origin/dev", "dev")
    _git(repo, "checkout", "-q", BRANCH)


def _check(repo):
    return subprocess.run(
        [sys.executable, str(SCRIPT), "--branch", BRANCH, "--base", "origin/dev"],
        cwd=repo, capture_output=True, text=True,
        env={**os.environ, "PYTHONIOENCODING": "utf-8"})


def _recipe(output):
    block = output.split("How to fix all of the above", 1)[1]
    return [line.strip() for line in block.splitlines()
            if line.strip().startswith("git ") and line.strip() != "git push"]


def _run_recipe(repo, commands):
    for command in commands:
        subprocess.run(["bash", "-c", command], cwd=repo, check=True,
                       capture_output=True, text=True)


def _fix_and_recheck(repo):
    first = _check(repo)
    assert first.returncode == 1, first.stdout + first.stderr
    commands = _recipe(first.stdout)
    _run_recipe(repo, commands)
    second = _check(repo)
    return commands, second


# (a) a stray edit to another resource's policy, which dev then changes too
def test_a_stray_edit_is_fixed_without_a_merge_after_dev_moves_on(repo):
    _write(repo, SIBLING_POLICY, "package foo\n# stray\n")
    _commit(repo, "stray edit")
    _advance_dev(repo, SIBLING_POLICY, "package foo\n# dev v2\n")

    commands, second = _fix_and_recheck(repo)

    assert not any(c.startswith("git merge ") for c in commands)
    assert second.returncode == 0, second.stdout + second.stderr
    # the contributor's own work survived the recipe
    assert (repo / OWN / "location/compliant.tf").read_text() == "# mine\n"


# (b) a stray addition and a stray deletion in another resource's inputs/
def test_a_stray_addition_and_deletion_are_fixed_without_a_merge(repo):
    _write(repo, f"{SIBLING_INPUTS}/foo/extra.tf", "# stray\n")
    (repo / SIBLING_INPUTS / "foo/noncompliant.tf").unlink()
    _commit(repo, "stray add + delete")
    _advance_dev(repo, f"{SIBLING_INPUTS}/foo/compliant.tf", "# dev v2\n")

    commands, second = _fix_and_recheck(repo)

    assert not any(c.startswith("git merge ") for c in commands)
    assert second.returncode == 0, second.stdout + second.stderr
    assert not (repo / SIBLING_INPUTS / "foo/extra.tf").exists()
    assert (repo / SIBLING_INPUTS / "foo/noncompliant.tf").exists()
    assert (repo / OWN / "location/compliant.tf").read_text() == "# mine\n"


# (c) the shared harness and the legacy plan cache still get the merge recipe
@pytest.mark.parametrize("path", ["scripts/tool.py", "inputs/plan_cache/gcp/old.json"])
def test_the_harness_and_plan_cache_still_get_the_merge_recipe(repo, path):
    _write(repo, path, "# stray\n")
    _write(repo, SIBLING_POLICY, "package foo\n# stray\n")
    _commit(repo, "stray edits")
    _advance_dev(repo, "README.md", "v2\n")

    commands, second = _fix_and_recheck(repo)

    assert commands[0] == "git merge origin/dev"
    assert commands[1].startswith("git restore --source=origin/dev ")
    assert second.returncode == 0, second.stdout + second.stderr
    assert (repo / OWN / "location/compliant.tf").read_text() == "# mine\n"
