"""What the linter treats as a stray file in a fixture directory.

An argument directory holds three *.tf files and one committed `<sha>.json` plan.
Anything else is either the contributor's own working mess — the guide tells them
to run `terraform plan --out=plan` and `terraform show -json plan > plan.json` to
find an attribute path, so those files are *expected* to exist locally — or a file
that will reach dev and should not.

Git already knows which is which, so the linter asks it rather than keeping a list
of names that drifts out of date. These tests pin the two halves of that: what git
ignores is not reported, and what git would commit is — including a file that a
later .gitignore rule matches but that is already tracked, which is exactly how a
binary `tfplan` reached dev in #704.
"""

import os
import subprocess
import sys
from pathlib import Path

import pytest

project_root = Path(__file__).parent.parent.parent.parent
sys.path.insert(0, str(project_root / "scripts" / "linters"))

import linter  # noqa: E402


def _git(*args, cwd):
    return subprocess.run(["git", *args], cwd=cwd, capture_output=True, text=True)


@pytest.fixture
def repo(tmp_path):
    """A git checkout with a .gitignore covering the terraform artifacts."""
    _git("init", "-q", cwd=tmp_path)
    _git("config", "user.email", "t@example.com", cwd=tmp_path)
    _git("config", "user.name", "t", cwd=tmp_path)
    (tmp_path / ".gitignore").write_text("plan\nplan.json\ntfplan\n")
    d = tmp_path / "inputs" / "gcp" / "Cloud Storage" / "google_storage_bucket" / "location"
    d.mkdir(parents=True)
    for name in ("compliant.tf", "config.tf", "nonCompliant.tf"):
        (d / name).write_text("# fixture\n")
    _git("add", "-A", cwd=tmp_path)
    _git("commit", "-qm", "init", cwd=tmp_path)
    return tmp_path, d


def _ignored(repo_root, inputs_root):
    """`ignored_under` as the validator calls it: relative to the working dir."""
    cwd = os.getcwd()
    os.chdir(repo_root)
    try:
        return linter.ignored_under(inputs_root)
    finally:
        os.chdir(cwd)


def test_the_artifacts_the_guide_produces_are_ignored(repo):
    root, d = repo
    for name in ("plan", "plan.json", "tfplan"):
        (d / name).write_text("x")
    ignored = _ignored(root, "inputs")
    for name in ("plan", "plan.json", "tfplan"):
        rel = os.path.normpath(os.path.join("inputs", "gcp", "Cloud Storage",
                                            "google_storage_bucket", "location", name))
        assert rel in ignored, f"{name} should be ignored"


def test_a_file_git_would_commit_is_not_ignored(repo):
    root, d = repo
    (d / "notes.txt").write_text("x")
    ignored = _ignored(root, "inputs")
    rel = os.path.normpath("inputs/gcp/Cloud Storage/google_storage_bucket/location/notes.txt")
    assert rel not in ignored


def test_a_tracked_file_is_never_ignored_however_well_gitignore_matches_it(repo):
    # The #704 case: a binary tfplan was committed before .gitignore covered the
    # name. Once tracked, git keeps committing it — so the linter must keep seeing
    # it, or the rule that was meant to catch it silently stops.
    root, d = repo
    (d / "tfplan").write_text("binaryish")
    _git("add", "-f", str(d / "tfplan"), cwd=root)
    _git("commit", "-qm", "oops", cwd=root)

    ignored = _ignored(root, "inputs")
    rel = os.path.normpath("inputs/gcp/Cloud Storage/google_storage_bucket/location/tfplan")
    assert rel not in ignored, "a tracked file must stay visible to the linter"


def test_outside_a_git_checkout_it_declines_to_answer(tmp_path):
    # None, not an empty set: an empty set would mean "git says nothing is ignored",
    # which would flag every contributor's plan.json. The callers fall back to the
    # name allow-list instead.
    plain = tmp_path / "not-a-repo"
    (plain / "inputs").mkdir(parents=True)
    cwd = os.getcwd()
    os.chdir(plain)
    try:
        assert linter.ignored_under("inputs") is None
    finally:
        os.chdir(cwd)


def test_the_real_repo_has_no_strays():
    # The whole point, asserted against the tree that ships: every file in every
    # argument directory is a fixture, its committed plan, or something git ignores.
    cwd = os.getcwd()
    os.chdir(project_root)
    try:
        ignored = linter.ignored_under("inputs")
        assert ignored is not None, "the repo is a git checkout"
        strays = []
        for arg_dir in Path("inputs").glob("gcp/*/*/*"):
            if not arg_dir.is_dir():
                continue
            for f in arg_dir.iterdir():
                if f.is_dir() or f.suffix in (".tf", ".json"):
                    continue
                if os.path.normpath(str(f)) not in ignored:
                    strays.append(str(f))
        assert strays == [], f"committed strays in fixture dirs: {strays}"
    finally:
        os.chdir(cwd)
