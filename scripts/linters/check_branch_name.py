#!/usr/bin/env python3
"""
Validate branch naming convention:
- gcp/service/<service_name> (service-based branches)
- feature/<feature_name> (feature branches)
- fix/<fix_name> (bug fix branches)
- Protected: dev

Example valid branches:
- gcp/service/biglake
- feature/fix-rego-syntax
- fix/broken-import
- dev (protected)

Invalid branches:
- bugfix/something
- my-branch
- main
"""

import subprocess
import sys
import re


def get_current_branch():
    """Get the current git branch name"""
    result = subprocess.run(
        ["git", "rev-parse", "--abbrev-ref", "HEAD"],
        capture_output=True,
        text=True
    )
    return result.stdout.strip()


def validate_branch_name(branch):
    """
    Validate branch follows one of these patterns:
    1. gcp/service/<service_name> (service-based)
    2. feature/<feature_name> (feature branches)
    3. fix/<fix_name> (bug fix branches)
    
    Rules for all branches:
    - Must start with the correct prefix
    - Name must be lowercase alphanumeric with underscores or hyphens
    - At least 2 characters long
    """
    service_pattern = r"^gcp/service/[a-z0-9_-]{2,}$"
    feature_pattern = r"^feature/[a-z0-9_-]{2,}$"
    fix_pattern = r"^fix/[a-z0-9_-]{2,}$"
    
    if re.match(service_pattern, branch) or re.match(feature_pattern, branch) or re.match(fix_pattern, branch):
        return True, None
    
    return False, (
        f"Branch '{branch}' does not match naming convention.\n"
        f"Expected formats:\n"
        f"  - gcp/service/<service_name> (e.g., gcp/service/biglake)\n"
        f"  - feature/<feature_name> (e.g., feature/add-validator)\n"
        f"  - fix/<fix_name> (e.g., fix/unicode-error)\n"
        f"Examples:\n"
        f"  - gcp/service/cloud_run\n"
        f"  - gcp/service/cloud-storage\n"
        f"  - feature/add-validator\n"
        f"  - feature/improve-error-handling\n"
        f"  - fix/broken-import\n"
        f"  - fix/logger-issue"
    )


def main():
    # Get current branch
    branch = get_current_branch()
    
    # List of protected branches that bypass the check
    protected_branches = {"dev"}
    
    if branch in protected_branches:
        print(f"[*] Branch '{branch}' is allowed (protected branch)")
        return 0
    
    # Validate branch name
    is_valid, error = validate_branch_name(branch)
    
    if is_valid:
        print(f"[OK] Branch '{branch}' follows naming convention")
        return 0
    else:
        print(f"[FAIL] Invalid branch name")
        print(f"\n{error}\n")
        return 1


if __name__ == "__main__":
    sys.exit(main())


