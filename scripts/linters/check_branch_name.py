#!/usr/bin/env python3
"""
Validate branch naming convention:
- gcp/service/<service_name> (service-based branches)
- feature/<feature_name> (feature branches)
- fix/<fix_name> (bug fix branches)
- chore/<chore_name> (maintenance/cleanup branches)
- docs/<docs_name> (documentation branches)
- refactor/<refactor_name> (refactor branches)
- Protected: dev

Example valid branches:
- gcp/service/biglake
- feature/fix-rego-syntax
- fix/broken-import
- chore/docgen-consolidation
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
    4. chore/<chore_name> (maintenance/cleanup branches)
    5. docs/<docs_name> (documentation branches)
    6. refactor/<refactor_name> (refactor branches)

    Rules for all branches:
    - Must start with the correct prefix
    - Name must be lowercase alphanumeric with underscores or hyphens
    - At least 2 characters long
    """
    # gcp uses a two-segment prefix (gcp/service/<name>); the rest are single.
    patterns = [
        r"^gcp/service/[a-z0-9_-]{2,}$",
        r"^feature/[a-z0-9_-]{2,}$",
        r"^fix/[a-z0-9_-]{2,}$",
        r"^chore/[a-z0-9_-]{2,}$",
        r"^docs/[a-z0-9_-]{2,}$",
        r"^refactor/[a-z0-9_-]{2,}$",
    ]

    if any(re.match(p, branch) for p in patterns):
        return True, None

    return False, (
        f"Branch '{branch}' does not match naming convention.\n"
        f"Expected formats:\n"
        f"  - gcp/service/<service_name> (e.g., gcp/service/biglake)\n"
        f"  - feature/<feature_name> (e.g., feature/add-validator)\n"
        f"  - fix/<fix_name> (e.g., fix/unicode-error)\n"
        f"  - chore/<chore_name> (e.g., chore/cleanup-egg-info)\n"
        f"  - docs/<docs_name> (e.g., docs/update-readme)\n"
        f"  - refactor/<refactor_name> (e.g., refactor/linter-content-checks)\n"
        f"Examples:\n"
        f"  - gcp/service/cloud_run\n"
        f"  - feature/add-validator\n"
        f"  - fix/broken-import\n"
        f"  - chore/docgen-consolidation"
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


