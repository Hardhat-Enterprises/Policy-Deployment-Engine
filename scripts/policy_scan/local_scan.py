import argparse
import subprocess
import sys
from pathlib import Path
import json


POLICIES_ROOT = Path("policies")
INPUTS_ROOT = Path("inputs")


def run_command(command: list[str]) -> subprocess.CompletedProcess:
    return subprocess.run(
        command,
        capture_output=True,
        text=True,
        shell=False,
    )


def get_current_git_branch() -> str:
    result = run_command(["git", "branch", "--show-current"])

    if result.returncode != 0:
        print("Error: could not detect current git branch.", file=sys.stderr)
        if result.stderr:
            print(result.stderr, file=sys.stderr)
        sys.exit(1)

    branch = result.stdout.strip()

    if not branch:
        print("Error: current git branch is empty or detached HEAD state.", file=sys.stderr)
        sys.exit(1)

    return branch


def validate_branch_matches(expected_branch: str) -> None:
    current_branch = get_current_git_branch()

    if current_branch != expected_branch:
        print("Error: branch mismatch.", file=sys.stderr)
        print(f"Current branch : {current_branch}", file=sys.stderr)
        print(f"Expected branch   : {expected_branch}", file=sys.stderr)
        print("Please switch to the correct branch or open a branch with the correct name.", file=sys.stderr)
        sys.exit(1)

    print(f"Branch validation passed: {current_branch}")


def parse_service_path(service_path: str) -> tuple[str, str]:
    parts = service_path.strip("/").split("/")

    if len(parts) != 2:
        print(
            "Error: service path must follow this format: <provider>/<service_name>",
            file=sys.stderr,
        )
        print("Example: gcp/artifact_registry", file=sys.stderr)
        sys.exit(1)

    provider, service = parts

    if not provider or not service:
        print("Error: provider or service name is missing from service path.", file=sys.stderr)
        sys.exit(1)

    return provider, service


def build_expected_branch_name(provider: str, service: str) -> str:
    return f"{provider}/service/{service}"


def build_opa_query(provider: str, service: str, resource: str, policy: str, output_type: str) -> str:
    return (
        f"data.terraform.{provider}.security."
        f"{service}.{resource}.{policy}.{output_type}"
    )


def build_plan_path(provider: str, service: str, resource: str, policy: str) -> Path:
    return INPUTS_ROOT / provider / service / resource / policy / "plan.json"


def build_policy_file_path(provider: str, service: str, resource: str, policy: str) -> Path:
    return POLICIES_ROOT / provider / service / resource / policy / "policy.rego"


def get_resource_dirs(provider: str, service: str, resource: str | None = None) -> list[Path]:
    service_input_dir = INPUTS_ROOT / provider / service

    if not service_input_dir.exists():
        print(f"Error: service input directory not found: {service_input_dir}", file=sys.stderr)
        sys.exit(1)

    if resource:
        resource_dir = service_input_dir / resource

        if not resource_dir.exists():
            print(f"Error: resource input directory not found: {resource_dir}", file=sys.stderr)
            sys.exit(1)

        return [resource_dir]

    return sorted(path for path in service_input_dir.iterdir() if path.is_dir())


def get_policy_dirs(resource_dir: Path, policy: str | None = None) -> list[Path]:
    if policy:
        policy_dir = resource_dir / policy

        if not policy_dir.exists():
            print(f"Error: policy input directory not found: {policy_dir}", file=sys.stderr)
            sys.exit(1)

        return [policy_dir]

    return sorted(path for path in resource_dir.iterdir() if path.is_dir())


def run_opa_eval(
    provider: str,
    plan_path: Path,
    query: str,
    output_format: str,
) -> int:
    policies_provider_root = POLICIES_ROOT / provider
    policies_helpers_root = POLICIES_ROOT / "_helpers"

    cmd = [
        "opa",
        "eval",
        "--data",
        str(policies_provider_root),
        "--data",
        str(policies_helpers_root),
        "--input",
        str(plan_path),
        query,
        "--format",
        output_format,
    ]

    # print("\nRunning OPA command:")
    # print(" ".join(cmd))
    # print()

    result = run_command(cmd)

    if result.stdout:
        print(result.stdout)

    if result.stderr:
        print(result.stderr, file=sys.stderr)

    return result.returncode


def validate_plan_resource_addresses(plan_path: Path, resource: str) -> bool:
    expected_compliant_address = f"{resource}.c"
    expected_non_compliant_address = f"{resource}.nc"

    try:
        with plan_path.open("r", encoding="utf-16") as file:
            plan_data = json.load(file)
    except UnicodeDecodeError as error:
        print(f"Skipping: could not read plan.json using utf-16 encoding at {plan_path}")
        print(f"Encoding error: {error}")
        print("Remedy: regenerate plan.json using UTF-16 encoding or update the script encoding to match the file.")
        return False
    except json.JSONDecodeError as error:
        print(f"Skipping: invalid JSON in plan.json at {plan_path}")
        print(f"JSON error: {error}")
        print('Remedy: regenerate plan.json using "terraform show -json plan > plan.json" and ensure the file contains valid JSON.')
        return False

    resources = (
        plan_data
        .get("planned_values", {})
        .get("root_module", {})
        .get("resources", [])
    )

    if len(resources) < 2:
        print("Skipping: plan.json must contain at least two resources.")
        print(f"Expected first resource  : {expected_compliant_address}")
        print(f"Expected second resource : {expected_non_compliant_address}")
        print("Remedy: add both compliant and non-compliant Terraform resources, then regenerate plan.json.")
        return False

    compliant_address = resources[0].get("address")
    non_compliant_address = resources[1].get("address")

    missing_or_invalid = False

    if compliant_address != expected_compliant_address:
        print("Skipping: compliant resource name is incorrect.")
        print(f"Expected: {expected_compliant_address}")
        print(f"Found   : {compliant_address}")
        print(f"Remedy  : rename the compliant Terraform resource block to: {resource}.c")
        missing_or_invalid = True

    if non_compliant_address != expected_non_compliant_address:
        print("Skipping: non-compliant resource name is incorrect.")
        print(f"Expected: {expected_non_compliant_address}")
        print(f"Found   : {non_compliant_address}")
        print(f"Remedy  : rename the non-compliant Terraform resource block to: {resource}.nc")
        missing_or_invalid = True

    if missing_or_invalid:
        print("After fixing the Terraform resource names, regenerate plan.json and run the scan again.")
        return False

    print("Resource name validation passed.")
    return True


def scan_policy(
    provider: str,
    service: str,
    resource: str,
    policy: str,
    output_type: str,
    output_format: str,
) -> tuple[int, bool]:
    plan_path = build_plan_path(provider, service, resource, policy)
    policy_file_path = build_policy_file_path(provider, service, resource, policy)

    print("\n" + "=" * 90)
    print(f"Provider : {provider}")
    print(f"Service  : {service}")
    print(f"Resource : {resource}")
    print(f"Policy   : {policy}")
    print("=" * 90)

    if not policy_file_path.exists():
        print(f"Skipping: policy.rego not found at {policy_file_path}")
        return 0, False

    if not plan_path.exists():
        print(f"Skipping: plan.json not found at {plan_path}")
        return 0, False
    
    if not validate_plan_resource_addresses(plan_path, resource):
        return 0, False

    # print(f"\n----- {output_type.upper()} -----")

    query = build_opa_query(
        provider=provider,
        service=service,
        resource=resource,
        policy=policy,
        output_type=output_type,
    )

    exit_code = run_opa_eval(
        provider=provider,
        plan_path=plan_path,
        query=query,
        output_format=output_format,
    )


    return exit_code, True


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Run local OPA policy scans from a provider/service name."
    )

    parser.add_argument(
        "service_path",
        help="Service path in format: <provider>/<service_name>. Example: gcp/artifact_registry",
    )

    parser.add_argument(
        "--resource",
        "--resourse",
        dest="resource",
        required=False,
        help="Optional Terraform resource name. Example: google_artifact_registry_repository",
    )

    parser.add_argument(
        "--policy",
        required=False,
        help="Optional policy folder name. Example: approved_formats",
    )

    output_group = parser.add_mutually_exclusive_group(required=False)

    output_group.add_argument(
        "--message",
        action="store_true",
        help="Show policy message output",
    )

    output_group.add_argument(
        "--details",
        action="store_true",
        help="Show policy details output",
    )

    parser.add_argument(
        "--format",
        default="pretty",
        choices=["pretty", "json", "raw"],
        help="OPA output format. Default: pretty",
    )

    args = parser.parse_args()

    provider, service = parse_service_path(args.service_path)

    expected_branch = build_expected_branch_name(provider, service)
    
    validate_branch_matches(expected_branch)

    if args.policy and not args.resource:
        print(
            "Error: --policy cannot be used without --resource because policies are inside resource folders.",
            file=sys.stderr,
        )
        sys.exit(1)

    if args.details:
        output_type = "details"
    else:
        output_type = "message"

    resource_dirs = get_resource_dirs(
        provider=provider,
        service=service,
        resource=args.resource,
    )

    final_exit_code = 0
    scanned_count = 0
    skipped_count = 0

    for resource_dir in resource_dirs:
        resource_name = resource_dir.name

        policy_dirs = get_policy_dirs(
            resource_dir=resource_dir,
            policy=args.policy,
        )

        for policy_dir in policy_dirs:
            policy_name = policy_dir.name

            exit_code, scanned = scan_policy(
                provider=provider,
                service=service,
                resource=resource_name,
                policy=policy_name,
                output_type=output_type,
                output_format=args.format,
            )

            if scanned:
                scanned_count += 1
            else:
                skipped_count += 1

            if exit_code != 0:
                final_exit_code = exit_code

    print("\n" + "=" * 90)
    print("Local policy scan completed")
    print(f"Scanned policies : {scanned_count}")
    print(f"Skipped policies : {skipped_count}")
    print("=" * 90)

    sys.exit(final_exit_code)


if __name__ == "__main__":
    main()