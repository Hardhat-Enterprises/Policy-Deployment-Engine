import sys
import subprocess
import os

def normalize_path(path):
    return path.replace("\\", "/")

def get_deleted_files():
    """
    Get deleted files from staged changes
    """
    result = subprocess.run(
        ["git", "diff", "--cached", "--name-only", "--diff-filter=D"],
        capture_output=True,
        text=True
    )
    return set(result.stdout.splitlines())


def extract_csp_and_service(file_path):
    """
    Extract CSP and service from:

    PDE/policies/<csp>/<service>/...
    PDE/inputs/<csp>/<service>/...
    """
    file_path = normalize_path(file_path)
    parts = file_path.split("/")

    try:
        if "policies" in parts:
            idx = parts.index("policies")
        elif "inputs" in parts:
            idx = parts.index("inputs")
        else:
            return None, None

        csp = parts[idx + 1]
        service = parts[idx + 2]

        return csp, service

    except (IndexError, ValueError):
        return None, None


def is_relevant_file(file_path):
    """
    Check if file is inside PDE policies or inputs
    (no extension filtering to support deleted files)
    """
    file_path = normalize_path(file_path)

    return (
        file_path.startswith("Policy-Deployment-Engine/policies/")
        or file_path.startswith("Policy-Deployment-Engine/inputs/")
    )


def main():
    staged_files = set(sys.argv[1:])
    deleted_files = get_deleted_files()

    all_files = staged_files.union(deleted_files)

    if not all_files:
        print("No files staged.")
        return 0

    print("\nFiles considered for linting:")
    for f in all_files:
        print(f" - {f}")

    targets = set()  # (csp, service)

    for file in all_files:
        if not is_relevant_file(file):
            continue

        csp, service = extract_csp_and_service(file)
        if csp and service:
            targets.add((csp, service))

    if not targets:
        print("\nNo relevant CSP services impacted — skipping linter.")
        return 0

    print("\nDetected targets:")
    for csp, service in targets:
        print(f" - {csp}/{service}")

    failed = False

    for csp, service in targets:
        print("\n====================================")
        print(f"Running linter for {csp}/{service}")
        print("====================================")

        result = subprocess.run(
            ["python", "scripts/linters/linter.py", f"--{csp}", service]
        )

        if result.returncode == 0:
            print(f"{csp}/{service} passed\n")
        else:
            print(f"{csp}/{service} failed\n")
            failed = True

    if failed:
        print("====================================")
        print("PRE-COMMIT CHECK FAILED")
        print("Fix the above errors before committing.")
        print("====================================\n")
        return 1

    print("====================================")
    print("PRE-COMMIT CHECK PASSED")
    print("====================================\n")
    return 0


if __name__ == "__main__":
    sys.exit(main())