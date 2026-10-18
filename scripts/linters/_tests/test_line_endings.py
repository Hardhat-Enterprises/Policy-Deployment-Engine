"""Unit tests for scripts/linters/check_line_endings.py.

The detector reads the *index*, not the working tree, so every case here builds a
real throwaway repo and commits into it. That distinction is the whole point: a
CRLF working tree is normal and harmless on Windows; a CRLF *blob* is the thing
that shows as modified in every clean checkout forever.
"""

import subprocess
import sys
from pathlib import Path

import pytest

project_root = Path(__file__).parent.parent.parent.parent
sys.path.insert(0, str(project_root))

from scripts.linters import check_line_endings as cle


def _git(*args, cwd):
    proc = subprocess.run(["git", *args], cwd=cwd, capture_output=True, text=True)
    assert proc.returncode == 0, f"git {' '.join(args)}: {proc.stderr}"
    return proc.stdout


@pytest.fixture
def repo(tmp_path):
    """A repo with a policies/ tree and no .gitattributes (so blobs go in verbatim)."""
    _git("init", "--quiet", cwd=tmp_path)
    _git("config", "user.email", "t@example.com", cwd=tmp_path)
    _git("config", "user.name", "t", cwd=tmp_path)
    _git("config", "core.autocrlf", "false", cwd=tmp_path)
    (tmp_path / "policies").mkdir()
    return tmp_path


def _commit(repo, name, data: bytes):
    path = repo / "policies" / name
    path.write_bytes(data)
    _git("add", "--", f"policies/{name}", cwd=repo)
    _git("commit", "--quiet", "-m", name, cwd=repo)
    return path


def test_an_lf_blob_is_clean(repo):
    _commit(repo, "a.tf", b'resource "x" "y" {}\n')
    assert cle.crlf_files(("policies",), cwd=repo) == []


def test_a_crlf_blob_is_reported(repo):
    _commit(repo, "a.tf", b'resource "x" "y" {}\r\n')
    assert cle.crlf_files(("policies",), cwd=repo) == ["policies/a.tf"]


def test_a_mixed_blob_is_reported(repo):
    # Half CRLF, half LF — git calls this `i/mixed`, and it is just as sticky.
    _commit(repo, "a.tf", b'a = 1\r\nb = 2\n')
    assert cle.crlf_files(("policies",), cwd=repo) == ["policies/a.tf"]


def test_a_file_with_no_line_endings_is_clean(repo):
    # `i/none` — a single line with no terminator. Nothing to normalise.
    _commit(repo, "a.tf", b"a = 1")
    assert cle.crlf_files(("policies",), cwd=repo) == []


def test_a_binary_file_is_never_reported(repo):
    # `i/-text`. A .png full of \r\n bytes is not a line-ending problem.
    _commit(repo, "a.png", b"\x89PNG\r\n\x1a\n\x00\x01\x02\r\n")
    assert cle.crlf_files(("policies",), cwd=repo) == []


def test_only_the_index_counts_not_the_working_tree(repo):
    # The distinction the whole check rests on: a contributor may hold CRLF in
    # their working tree (Windows default) with an LF blob committed, and that is
    # the *correct* state — it must not be reported.
    path = _commit(repo, "a.tf", b"a = 1\n")
    path.write_bytes(b"a = 1\r\n")
    assert cle.crlf_files(("policies",), cwd=repo) == []


def test_results_are_sorted(repo):
    for name in ("c.tf", "a.tf", "b.tf"):
        _commit(repo, name, b"x = 1\r\n")
    assert cle.crlf_files(("policies",), cwd=repo) == [
        "policies/a.tf", "policies/b.tf", "policies/c.tf"]


def test_untracked_files_are_invisible(repo):
    _commit(repo, "a.tf", b"a = 1\n")
    (repo / "policies" / "scratch.tf").write_bytes(b"junk\r\n")
    assert cle.crlf_files(("policies",), cwd=repo) == []


# --------------------------------------------------------------------------- #
# Line parsing — the `git ls-files --eol` format is space-padded, not tabbed,
# for its first three fields, which is easy to get wrong.
# --------------------------------------------------------------------------- #
@pytest.mark.parametrize("line,expected", [
    ("i/lf    w/lf    attr/text eol=lf      \tpolicies/a.tf", ("lf", "policies/a.tf")),
    ("i/crlf  w/crlf  attr/text eol=lf      \tpolicies/a.tf", ("crlf", "policies/a.tf")),
    ("i/-text w/-text attr/                 \tpolicies/a.png", ("-text", "policies/a.png")),
    # A path containing a space must survive: the path is everything after the
    # last tab, and this repo is full of them ("Compute Engine").
    ("i/crlf  w/crlf  attr/                 \tpolicies/gcp/Compute Engine/a.tf",
     ("crlf", "policies/gcp/Compute Engine/a.tf")),
])
def test_eol_lines_parse(line, expected):
    assert cle.parse_eol_line(line) == expected


@pytest.mark.parametrize("line", ["", "not a git line", "i/lf w/lf attr/ no-tab-here"])
def test_unparseable_lines_are_skipped(line):
    assert cle.parse_eol_line(line) is None


# --------------------------------------------------------------------------- #
# Exit codes — it is wired report-only in CI, but must still work as a check.
# --------------------------------------------------------------------------- #
def test_main_exits_zero_on_the_real_repo(capsys):
    # dev is LF-clean and must stay that way; this is the regression guard.
    assert cle.main([]) == 0
    assert "[OK]" in capsys.readouterr().out


def test_main_exits_one_when_something_is_found(repo, monkeypatch, capsys):
    monkeypatch.setattr(cle, "crlf_files", lambda *a, **k: ["policies/a.tf"])
    assert cle.main([]) == 1
    out = capsys.readouterr().out
    assert "policies/a.tf" in out
    assert "git add --renormalize" in out, "the remedy is the point of the output"


def test_quiet_drops_the_remedy(repo, monkeypatch, capsys):
    monkeypatch.setattr(cle, "crlf_files", lambda *a, **k: ["policies/a.tf"])
    assert cle.main(["--quiet"]) == 1
    out = capsys.readouterr().out
    assert "policies/a.tf" in out
    assert "git add --renormalize" not in out
