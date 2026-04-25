#!/usr/bin/env python3
"""
Policy Check Workflow Orchestrator
Handles the complete workflow: extract services, run checks, post results
"""

import os
import sys
import subprocess
from pathlib import Path
from typing import Set, List, Tuple


def get_changed_files() -> List[str]:
    """Get list of changed files from GitHub Actions environment."""
    changed_files_str = os.getenv("CHANGED_FILES", "")
    if not changed_files_str:
        return []
    return changed_files_str.split()


def print_changed_files(changed_files: List[str]) -> None:
    """Log all changed files."""
    for file in changed_files:
        if file:
            print(f"{file} was changed")


def extract_affected_services(changed_files: List[str]) -> Set[str]:
    """Extract unique GCP service names from changed file paths."""
    services = set()
    
    for file_path in changed_files:
        # Match inputs/gcp/<service>/* or policies/gcp/<service>/*
        if "inputs/gcp/" in file_path or "policies/gcp/" in file_path:
            parts = file_path.split("/")
            try:
                idx = parts.index("gcp")
                if idx + 1 < len(parts):
                    service = parts[idx + 1]
                    if service:  # Ensure service name is not empty
                        services.add(service)
            except (ValueError, IndexError):
                continue
    
    return services


def run_policy_checks(services: Set[str]) -> Tuple[str, int, str]:
    """
    Run policy checks for affected services.
    
    Returns:
        Tuple of (overall_status, exit_code, test_output)
    """
    if not services:
        return "ℹ️ No policy files changed", 0, "No input or policy files were modified in this PR"
    
    test_results = []
    exit_code = 0
    
    for service in sorted(services):
        print(f"Running tests for service: {service}")
        
        inputs_path = f"inputs/gcp/{service}"
        policies_path = f"policies/gcp/{service}"
        
        inputs_exists = Path(inputs_path).is_dir()
        policies_exists = Path(policies_path).is_dir()
        
        if not (inputs_exists or policies_exists):
            print(f"No inputs or policies found for service: {service}")
            continue
        
        # Build command
        cmd = ["python3", "scripts/auto_test/auto_test.py", "--verbose"]
        if inputs_exists:
            cmd.extend(["--inputs", inputs_path])
        if policies_exists:
            cmd.extend(["--policies", policies_path])
        
        # Run the policy check
        result = subprocess.run(cmd, capture_output=True, text=True)
        test_results.append(result.stdout)
        if result.stderr:
            test_results.append(result.stderr)
        
        if result.returncode != 0:
            exit_code = result.returncode
    
    test_output = "\n".join(test_results)
    
    # Determine overall status
    if exit_code != 0:
        overall_status = "❌ CHECKS FAILED - PR will not be reviewed until all policy checks pass"
    else:
        overall_status = "✅ All checks passed"
    
    return overall_status, exit_code, test_output


def write_github_summary(overall_status: str, test_output: str) -> None:
    """Write results to GitHub Actions job summary."""
    summary_file = os.getenv("GITHUB_STEP_SUMMARY")
    if not summary_file:
        return
    
    summary_content = f"""## Policy Check Results

{overall_status}

### Details
```
{test_output}
```
"""
    
    with open(summary_file, "a") as f:
        f.write(summary_content)


def create_pr_comment(test_output: str, has_failures: bool) -> str:
    """Create PR comment content."""
    if not test_output:
        return """## 🔍 Policy Check Results

**Status**: ℹ️ No policy files changed

No input or policy files were modified in this PR"""
    
    if has_failures:
        return f"""## 🔍 Policy Check Results

**Status**: ❌ CHECKS FAILED

⚠️ **Your PR will not be reviewed until you fix all policy check failures below:**

### Test Output
```
{test_output}
```"""
    
    return f"""## 🔍 Policy Check Results

**Status**: ✅ All checks passed

### Test Output
```
{test_output}
```"""


def post_pr_comment(comment: str) -> int:
    """Post comment to PR."""
    pr_number = os.getenv("PR_NUMBER")
    if not pr_number:
        print("PR_NUMBER environment variable not set, skipping comment")
        return 0
    
    # Write comment to file
    with open("pr_comment.md", "w") as f:
        f.write(comment)
    
    # Post to PR
    result = subprocess.run(
        ["gh", "pr", "comment", pr_number, "-F", "pr_comment.md"],
        capture_output=True,
        text=True
    )
    
    if result.returncode != 0:
        print(f"Error posting comment: {result.stderr}")
        return 1
    
    print("PR comment posted successfully")
    return 0


def main():
    """Main workflow orchestration."""
    # Get changed files
    changed_files = get_changed_files()
    
    if not changed_files:
        print("No changed files detected")
        return 0
    
    # Print all changed files
    print_changed_files(changed_files)
    
    # Extract affected services
    services = extract_affected_services(changed_files)
    print(f"Affected services: {' '.join(sorted(services))}")
    
    # Run policy checks
    overall_status, exit_code, test_output = run_policy_checks(services)
    
    # Write GitHub summary
    write_github_summary(overall_status, test_output)
    
    # Create and post PR comment
    if os.getenv("PR_NUMBER"):
        comment = create_pr_comment(test_output, exit_code != 0)
        post_pr_comment(comment)
    
    print(overall_status)
    return exit_code


if __name__ == "__main__":
    sys.exit(main())
