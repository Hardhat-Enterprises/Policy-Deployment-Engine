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


def run_existing_service_linter(provider: str, service: str) -> tuple[bool, str | None]:
    if provider != "gcp":
        print(f"Skipping linter: current linter only supports GCP, but provider is '{provider}'.")
        return True, None

    result = subprocess.run(
        ["python", "scripts/linters/linter.py", "--gcp", service],
        text=True,
    )

    if result.returncode != 0:
        reason = f"Service linter failed for {provider}/{service}"
        print(reason)
        return False, reason

    return True, None


def build_opa_query(provider: str, service: str, resource: str, policy: str, output_type: str) -> str:
    return (
        f"data.terraform.{provider}.security."
        f"{service}.{resource}.{policy}.{output_type}"
    )


def build_plan_path(provider: str, service: str, resource: str, policy: str) -> Path:
    return INPUTS_ROOT / provider / service / resource / policy / "plan.json"


def build_policy_file_path(provider: str, service: str, resource: str, policy: str) -> Path:
    return POLICIES_ROOT / provider / service / resource / policy / "policy.rego"


def get_service_dirs(provider: str, service: str | None = None) -> list[Path]:
    provider_input_dir = INPUTS_ROOT / provider

    if not provider_input_dir.exists():
        print(f"Error: provider input directory not found: {provider_input_dir}", file=sys.stderr)
        sys.exit(1)

    if service:
        service_dir = provider_input_dir / service

        if not service_dir.exists():
            print(f"Error: service input directory not found: {service_dir}", file=sys.stderr)
            sys.exit(1)

        return [service_dir]

    return sorted(path for path in provider_input_dir.iterdir() if path.is_dir())


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
) -> tuple[int, bool, str | None]:
    plan_path = build_plan_path(provider, service, resource, policy)
    policy_file_path = build_policy_file_path(provider, service, resource, policy)

    print("\n" + "=" * 90)
    print(f"Provider : {provider}")
    print(f"Service  : {service}")
    print(f"Resource : {resource}")
    print(f"Policy   : {policy}")
    print("=" * 90)

    if not policy_file_path.exists():
        reason = f"policy.rego not found at {policy_file_path}"
        print(f"Skipping: {reason}")
        return 0, False, reason

    if not plan_path.exists():
        reason = f"plan.json not found at {plan_path}"
        print(f"Skipping: {reason}")
        return 0, False, reason

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

    if exit_code != 0:
        return exit_code, True, f"OPA evaluation failed for {provider}/{service}/{resource}/{policy}"

    return exit_code, True, None


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Run local OPA policy scans by provider, service, resource, or policy."
    )

    parser.add_argument(
        "-p",
        "--provider",
        required=True,
        help="Cloud provider to scan. Example: gcp",
    )

    parser.add_argument(
        "-s",
        "--service",
        required=False,
        help="Optional service name. Example: artifact_registry",
    )

    parser.add_argument(
        "-r",
        "--resource",
        required=False,
        help="Optional Terraform resource name. Example: google_artifact_registry_repository",
    )

    parser.add_argument(
        "-po",
        "--policy",
        required=False,
        help="Optional policy folder name. Example: approved_formats",
    )

    output_group = parser.add_mutually_exclusive_group(required=False)

    output_group.add_argument(
        "-m",
        "--message",
        action="store_true",
        help="Show policy message output. This is the default option.",
    )

    output_group.add_argument(
        "-d",
        "--details",
        action="store_true",
        help="Show policy details output.",
    )

    parser.add_argument(
        "-f",
        "--format",
        default="pretty",
        choices=["pretty", "json", "raw"],
        help="OPA output format. Default: pretty",
    )

    args = parser.parse_args()

    provider = args.provider
    service = args.service

    if args.resource and not service:
        print(
            "Error: --resource cannot be used without --service because resources are inside service folders.",
            file=sys.stderr,
        )
        sys.exit(1)

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

    service_dirs = get_service_dirs(
        provider=provider,
        service=service,
    )

    final_exit_code = 0
    successful_policies = []
    failed_checks = []

    for service_dir in service_dirs:
        service_name = service_dir.name

        linter_ok, linter_problem = run_existing_service_linter(provider, service_name)

        if not linter_ok:
            failed_checks.append((f"{provider}/{service_name}", linter_problem or "Service linter failed"))
            final_exit_code = 1
            continue

        resource_dirs = get_resource_dirs(
            provider=provider,
            service=service_name,
            resource=args.resource,
        )

        for resource_dir in resource_dirs:
            resource_name = resource_dir.name

            policy_dirs = get_policy_dirs(
                resource_dir=resource_dir,
                policy=args.policy,
            )

            for policy_dir in policy_dirs:
                policy_name = policy_dir.name

                policy_ref = f"{provider}/{service_name}/{resource_name}/{policy_name}"

                exit_code, scanned, problem = scan_policy(
                    provider=provider,
                    service=service_name,
                    resource=resource_name,
                    policy=policy_name,
                    output_type=output_type,
                    output_format=args.format,
                )

                if scanned and exit_code == 0:
                    successful_policies.append(policy_ref)
                else:
                    reason = problem or "OPA evaluation failed"
                    failed_checks.append((policy_ref, reason))
                    final_exit_code = 1

    print("\n" + "=" * 90)
    print(f"Successful policies : {len(successful_policies)}")
    print(f"Failed checks       : {len(failed_checks)}")

    # if successful_policies:
    #     print("\nSuccessful policies:")
    #     for policy_ref in successful_policies:
    #         print(f" - {policy_ref}")

    if failed_checks:
        print("\nFailed check details:")
        for check_ref, reason in failed_checks:
            print(f" - {check_ref}")
            print(f"   Reason: {reason}")

    print("=" * 90)

    sys.exit(final_exit_code)


if __name__ == "__main__":
    main()