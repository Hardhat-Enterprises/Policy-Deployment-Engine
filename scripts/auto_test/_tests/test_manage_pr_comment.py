"""Unit tests for persistent APC pull-request comment management."""

import subprocess
import sys
from pathlib import Path
from unittest.mock import patch

import pytest

project_root = Path(__file__).parent.parent.parent.parent
sys.path.insert(0, str(project_root))

from scripts.auto_test import manage_pr_comment


def completed_process(returncode=0, stdout="", stderr=""):
    """Build a fake result returned by subprocess.run."""
    return subprocess.CompletedProcess(
        args=[],
        returncode=returncode,
        stdout=stdout,
        stderr=stderr,
    )


def test_build_comment_body_for_success(monkeypatch):
    monkeypatch.setenv("GITHUB_SERVER_URL", "https://github.com")
    monkeypatch.setenv(
        "GITHUB_REPOSITORY",
        "Hardhat-Enterprises/Policy-Deployment-Engine",
    )
    monkeypatch.setenv("GITHUB_RUN_ID", "12345")

    body = manage_pr_comment.build_comment_body("481", "success")

    assert "PASSED" in body
    assert "actions/runs/12345" in body
    assert manage_pr_comment.MARKER in body


def test_build_comment_body_for_failure(monkeypatch):
    monkeypatch.setenv("GITHUB_REPOSITORY", "owner/repository")
    monkeypatch.setenv("GITHUB_RUN_ID", "67890")

    body = manage_pr_comment.build_comment_body("481", "failure")

    assert "FAILED" in body
    assert "actions/runs/67890" in body
    assert manage_pr_comment.MARKER in body


def test_find_existing_comment_returns_none_when_marker_is_absent():
    with patch.object(
        manage_pr_comment.subprocess,
        "run",
        return_value=completed_process(),
    ) as run_mock:
        comment_id = manage_pr_comment.find_existing_comment_id("481")

    assert comment_id is None
    command = run_mock.call_args.args[0]
    assert "--paginate" in command
    assert manage_pr_comment.MARKER in command[-1]
    assert '.user.type == "Bot"' in command[-1]


def test_find_existing_comment_returns_latest_numeric_id():
    with patch.object(
        manage_pr_comment.subprocess,
        "run",
        return_value=completed_process(stdout="101\n202\n"),
    ):
        comment_id = manage_pr_comment.find_existing_comment_id("481")

    assert comment_id == "202"


def test_find_existing_comment_raises_when_lookup_fails():
    with patch.object(
        manage_pr_comment.subprocess,
        "run",
        return_value=completed_process(
            returncode=1,
            stderr="GitHub API failure",
        ),
    ):
        with pytest.raises(RuntimeError, match="GitHub API failure"):
            manage_pr_comment.find_existing_comment_id("481")


def test_create_comment_when_no_marked_comment_exists():
    body = "new APC result"

    with (
        patch.object(
            manage_pr_comment,
            "find_existing_comment_id",
            return_value=None,
        ),
        patch.object(
            manage_pr_comment.subprocess,
            "run",
            return_value=completed_process(),
        ) as run_mock,
    ):
        result = manage_pr_comment.create_or_update_comment("481", body)

    assert result == 0
    assert run_mock.call_args.args[0] == [
        "gh",
        "pr",
        "comment",
        "481",
        "--body",
        body,
    ]


def test_update_existing_marked_comment():
    body = "updated APC result"

    with (
        patch.object(
            manage_pr_comment,
            "find_existing_comment_id",
            return_value="202",
        ),
        patch.object(
            manage_pr_comment.subprocess,
            "run",
            return_value=completed_process(),
        ) as run_mock,
    ):
        result = manage_pr_comment.create_or_update_comment("481", body)

    assert result == 0
    assert run_mock.call_args.args[0] == [
        "gh",
        "api",
        "repos/{owner}/{repo}/issues/comments/202",
        "-X",
        "PATCH",
        "-f",
        f"body={body}",
    ]


def test_comment_write_failure_returns_nonzero():
    with (
        patch.object(
            manage_pr_comment,
            "find_existing_comment_id",
            return_value=None,
        ),
        patch.object(
            manage_pr_comment.subprocess,
            "run",
            return_value=completed_process(
                returncode=1,
                stderr="permission denied",
            ),
        ),
    ):
        result = manage_pr_comment.create_or_update_comment(
            "481",
            "APC result",
        )

    assert result == 1