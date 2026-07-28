#!/usr/bin/env python3
"""
Manage PR labels based on policy check results.
Adds/removes labels depending on whether checks passed or failed.
"""

import os
import sys
import subprocess


def manage_pr_labels(check_outcome: str) -> int:
    """
    Manage PR labels based on policy check outcome.

    Args:
        check_outcome: the GitHub step ``outcome`` — only the literal "success"
            is treated as a pass. Anything else ("failure", "cancelled",
            "skipped", or an unexpected value) is treated as not-passed so a
            cancelled/misconfigured run can never apply CI-Approved (fail closed).

    Returns:
        Exit code (0 for success, 1 for failure)
    """
    pr_number = os.getenv("PR_NUMBER")

    if not pr_number:
        print("PR_NUMBER environment variable not set, skipping label management")
        return 0

    if check_outcome == "success":
        add_label, remove_label = "CI-Approved", "CI-Review-Required"
        print("Policy checks passed - Adding CI-Approved label and removing CI-Review-Required")
    else:
        add_label, remove_label = "CI-Review-Required", "CI-Approved"
        print(f"Policy checks not passed (outcome={check_outcome!r}) - "
              "Adding CI-Review-Required label and removing CI-Approved")

    # Remove the opposite label (ignore failure: it may simply not be present).
    subprocess.run(
        ["gh", "pr", "edit", pr_number, "--remove-label", remove_label],
        capture_output=True, text=True)

    result = subprocess.run(
        ["gh", "pr", "edit", pr_number, "--add-label", add_label],
        capture_output=True, text=True)
    if result.returncode != 0:
        print(f"Error adding {add_label} label: {result.stderr}")
        return 1

    print("Labels updated successfully")
    return 0


def main():
    """Main entry point."""
    # Outcome from $CHECK_OUTCOME or argv. Default to "failure" (fail closed) so a
    # misconfigured CI step that forgets to pass the outcome can't auto-approve a PR.
    check_outcome = os.getenv("CHECK_OUTCOME", sys.argv[1] if len(sys.argv) > 1 else "failure")

    return manage_pr_labels(check_outcome)


if __name__ == "__main__":
    sys.exit(main())
