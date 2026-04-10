import sys
import subprocess
import os

import os

def extract_csp_and_service(file_path):
    """
    Extract:
    csp and service from:

    PDE/policies/<csp>/<service>/...
    PDE/inputs/<csp>/<service>/...
    """

    parts = file_path.split(os.sep)

    try:
        # Find 'policies' or 'inputs'
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
    file_path = file_path.replace("\\", "/")  # normalize Windows paths

    return (
        file_path.endswith((".yaml", ".yml", ".json", ".rego", ".tf"))
        and (
            file_path.startswith("Policy-Deployment-Engine/policies/")
            or file_path.startswith("Policy-Deployment-Engine/inputs/")
        )
    )

def main():
    files = sys.argv[1:]

    if not files:
        print("No files staged.")
        return 0

    targets = set()  # (csp, service)

    for file in files:
        if not is_relevant_file(file):
            continue

        csp, service = extract_csp_and_service(file)
        if csp and service:
            targets.add((csp, service))

    if not targets:
        print("No relevant CSP services impacted.")
        return 0

    print("Detected targets:")
    for csp, service in targets:
        print(f" - {csp}/{service}")

    failed = False

    for csp, service in targets:
        print(f"\nRunning linter for {csp}/{service}")

        result = subprocess.run(
            ["python", "scripts/linters/linter.py", f"--{csp}", service]
        )

        if result.returncode != 0:
            failed = True

    if failed:
        print("\nLinting failed for one or more services.")
        return 1

    print("\nAll services passed linting.")
    return 0


if __name__ == "__main__":
    sys.exit(main())