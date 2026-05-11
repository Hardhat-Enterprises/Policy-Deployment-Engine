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
        check_outcome: 'failure' or 'success'
    
    Returns:
        Exit code (0 for success, 1 for failure)
    """
    pr_number = os.getenv("PR_NUMBER")
    
    if not pr_number:
        print("PR_NUMBER environment variable not set, skipping label management")
        return 0
    
    try:
        if check_outcome == "failure":
            print("Policy checks failed - Adding CI-Review-Required label and removing CI-Approved")
            
            # Remove CI-Approved label (ignore if not present)
            subprocess.run(
                ["gh", "pr", "edit", pr_number, "--remove-label", "CI-Approved"],
                capture_output=True
            )
            
            # Add CI-Review-Required label
            result = subprocess.run(
                ["gh", "pr", "edit", pr_number, "--add-label", "CI-Review-Required"],
                capture_output=True,
                text=True
            )
            
            if result.returncode != 0:
                print(f"Error adding CI-Review-Required label: {result.stderr}")
                return 1
        else:
            print("Policy checks passed - Adding CI-Approved label and removing CI-Review-Required")
            
            # Remove CI-Review-Required label (ignore if not present)
            subprocess.run(
                ["gh", "pr", "edit", pr_number, "--remove-label", "CI-Review-Required"],
                capture_output=True
            )
            
            # Add CI-Approved label
            result = subprocess.run(
                ["gh", "pr", "edit", pr_number, "--add-label", "CI-Approved"],
                capture_output=True,
                text=True
            )
            
            if result.returncode != 0:
                print(f"Error adding CI-Approved label: {result.stderr}")
                return 1
        
        print("Labels updated successfully")
        return 0
    
    except Exception as e:
        print(f"Error managing PR labels: {e}")
        return 1


def main():
    """Main entry point."""
    # Get the policy check outcome from environment or argument
    check_outcome = os.getenv("CHECK_OUTCOME", sys.argv[1] if len(sys.argv) > 1 else "success")
    
    return manage_pr_labels(check_outcome)


if __name__ == "__main__":
    sys.exit(main())
