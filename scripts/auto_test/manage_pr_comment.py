#!/usr/bin/env python3
"""
Create or update the APC (Automated Policy Check) result comment on a PR.

Keeps a single sticky comment per PR instead of posting a new one on every run.
Identifies "our" comment using a hidden HTML marker, following the same
gh-CLI-via-subprocess pattern as manage_pr_labels.py.
"""

import os
import sys
import subprocess

MARKER = "<!-- pde-apc-result -->"


def find_existing_comment_id(pr_number: str) -> str | None:
    """Return the numeric ID of the existing APC comment, if any."""
    result = subprocess.run(
        [
            "gh",
            "api",
            f"repos/{{owner}}/{{repo}}/issues/{pr_number}/comments",
            "--paginate",
            "--jq",
            f'.[] | select(.user.type == "Bot" and (.body | contains("{MARKER}"))) | .id',
        ],
        capture_output=True,
        text=True,
    )

    if result.returncode != 0:
        raise RuntimeError(
            f"Could not list existing PR comments: {result.stderr.strip()}"
        )

    comment_ids = result.stdout.strip().splitlines()
    return comment_ids[-1] if comment_ids else None


def build_comment_body(pr_number: str, check_outcome: str) -> str:
    """Build the short, sticky APC comment body per issue #405's spec:
    short status + a link to the latest full log, no inline error detail."""
    status_emoji = "\u2705 PASSED" if check_outcome == "success" else "\u274c FAILED"
    run_url = (
        f"{os.getenv('GITHUB_SERVER_URL', 'https://github.com')}/"
        f"{os.getenv('GITHUB_REPOSITORY', '')}/actions/runs/"
        f"{os.getenv('GITHUB_RUN_ID', '')}"
    )
    return (
        f"### \U0001f50d APC Result: {status_emoji}\n\n"
        f"See full details in the [workflow run log]({run_url}).\n\n"
        f"Please reference latest auto-test comment.\n\n"
        f"{MARKER}"
    )


def create_or_update_comment(pr_number: str, body: str) -> int:
    """Create the APC comment if none exists yet, else update the existing one."""
    existing_id = find_existing_comment_id(pr_number)

    if existing_id:
        print(f"Existing APC comment found (id={existing_id}) - updating it.")
        result = subprocess.run(
            ["gh", "api", f"repos/{{owner}}/{{repo}}/issues/comments/{existing_id}",
             "-X", "PATCH", "-f", f"body={body}"],
            capture_output=True, text=True)
    else:
        print("No existing APC comment found - creating a new one.")
        result = subprocess.run(
            ["gh", "pr", "comment", pr_number, "--body", body],
            capture_output=True, text=True)

    if result.returncode != 0:
        print(f"Error writing APC comment: {result.stderr}")
        return 1

    print("APC comment written successfully.")
    return 0


def main():
    pr_number = os.getenv("PR_NUMBER")
    check_outcome = os.getenv("CHECK_OUTCOME", "failure")

    if not pr_number:
        print("PR_NUMBER environment variable not set, skipping comment management")
        return 0

    body = build_comment_body(pr_number, check_outcome)
    return create_or_update_comment(pr_number, body)


if __name__ == "__main__":
    sys.exit(main())