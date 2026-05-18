import argparse
import subprocess
import sys
from pathlib import Path


POLICIES_ROOT = Path("policies")
INPUTS_ROOT = Path("inputs")


def run_command(command: list[str]) -> subprocess.CompletedProcess:
    return subprocess.run(
        command,
        capture_output=True,
        text=True,
        shell=False,
    )


def run_existing_branch_linter() -> None:
    result = run_command(["python", "scripts/linters/check_branch_name.py"])

    if result.stdout:
        print(result.stdout)

    if result.stderr:
        print(result.stderr, file=sys.stderr)

    if result.returncode != 0:
        print("Local scan stopped because the branch name does not follow the naming convention.")
        sys.exit(result.returncode)


def run_existing_service_linter(provider: str, service: str) -> None:
    if provider != "gcp":
        print(f"Skipping linter: current linter only supports GCP, but provider is '{provider}'.")
        return

    result = subprocess.run(
        ["python", "scripts/linters/linter.py", "--gcp", service],
        text=True,
    )

    if result.returncode != 0:
        print("Local scan stopped because the linter found issues.")
        print("Please fix the linter errors before running the policy scan.")
        sys.exit(result.returncode)


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

    run_existing_branch_linter()
    run_existing_service_linter(provider, service)
    
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