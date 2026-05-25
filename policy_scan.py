from concurrent.futures import ThreadPoolExecutor, as_completed
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


def run_opa_eval_with_logs(
    provider: str,
    plan_path: Path,
    query: str,
    output_format: str,
    logs: list[str],
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

    result = run_command(cmd)

    if result.stdout:
        logs.append(result.stdout)

    if result.stderr:
        logs.append(result.stderr)

    return result.returncode


def generate_plan_json(input_dir: Path, logs: list[str]) -> tuple[bool, str | None]:
    plan_file = input_dir / "plan"
    plan_json_file = input_dir / "plan.json"

    logs.append(f"plan.json not found. Generating Terraform plan in: {input_dir}")

    commands = [
        ["terraform", "init"],
        ["terraform", "plan", "--out=plan"],
    ]

    for command in commands:
        result = subprocess.run(
            command,
            cwd=input_dir,
            capture_output=True,
            text=True,
            shell=False,
        )

        if result.returncode != 0:
            reason = f"Terraform command failed: {' '.join(command)}"
            logs.append(reason)

            if result.stdout:
                logs.append(result.stdout)

            if result.stderr:
                logs.append(result.stderr)

            return False, reason

    show_result = subprocess.run(
        ["terraform", "show", "-json", str(plan_file.name)],
        cwd=input_dir,
        capture_output=True,
        shell=False,
    )

    if show_result.returncode != 0:
        reason = "Terraform command failed: terraform show -json plan"
        logs.append(reason)

        if show_result.stderr:
            logs.append(show_result.stderr.decode(errors="replace"))

        return False, reason

    plan_json_file.write_bytes(show_result.stdout)

    logs.append(f"Generated plan.json at: {plan_json_file}")
    return True, None


def scan_policy(
    provider: str,
    service: str,
    resource: str,
    policy: str,
    output_type: str,
    output_format: str,
) -> tuple[int, bool, str | None, str]:
    logs = []

    plan_path = build_plan_path(provider, service, resource, policy)
    policy_file_path = build_policy_file_path(provider, service, resource, policy)

    logs.append("=" * 90)
    logs.append(f"Provider : {provider}")
    logs.append(f"Service  : {service}")
    logs.append(f"Resource : {resource}")
    logs.append(f"Policy   : {policy}")
    logs.append("=" * 90)

    if not policy_file_path.exists():
        reason = f"policy.rego not found at {policy_file_path}"
        logs.append(f"Skipping: {reason}")
        return 0, False, reason, "\n".join(logs)

    if not plan_path.exists():
        input_dir = plan_path.parent

        generated, reason = generate_plan_json(input_dir, logs)

        if not generated:
            return 0, False, reason or f"plan.json could not be generated at {plan_path}", "\n".join(logs)

    query = build_opa_query(
        provider=provider,
        service=service,
        resource=resource,
        policy=policy,
        output_type=output_type,
    )

    exit_code = run_opa_eval_with_logs(
        provider=provider,
        plan_path=plan_path,
        query=query,
        output_format=output_format,
        logs=logs,
    )

    if exit_code != 0:
        return exit_code, True, f"OPA evaluation failed for {provider}/{service}/{resource}/{policy}", "\n".join(logs)

    return exit_code, True, None, "\n".join(logs)


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

    parser.add_argument(
        "-w",
        "--workers",
        type=int,
        default=4,
        help="Number of concurrent policy scans to run. Default: 4",
    )

    args = parser.parse_args()

    if args.workers < 1:
        print("Error: --workers must be at least 1.", file=sys.stderr)
        sys.exit(1)

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

    scan_targets = []

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

                scan_targets.append(
                    {
                        "provider": provider,
                        "service": service_name,
                        "resource": resource_name,
                        "policy": policy_name,
                        "policy_ref": policy_ref,
                    }
                )

    print(f"\nFound {len(scan_targets)} policies to scan. Starting scans with {args.workers} workers...\n")
    
    with ThreadPoolExecutor(max_workers=args.workers) as executor:
        future_to_policy = {
            executor.submit(
                scan_policy,
                target["provider"],
                target["service"],
                target["resource"],
                target["policy"],
                output_type,
                args.format,
            ): target["policy_ref"]
            for target in scan_targets
        }

        for future in as_completed(future_to_policy):
            policy_ref = future_to_policy[future]

            try:
                exit_code, scanned, problem, log_output = future.result()
                print(log_output)
            except Exception as error:
                failed_checks.append((policy_ref, f"Unexpected error: {error}"))
                final_exit_code = 1
                continue

            if scanned and exit_code == 0:
                successful_policies.append(policy_ref)
            else:
                reason = problem or "OPA evaluation failed"
                failed_checks.append((policy_ref, reason))
                final_exit_code = 1

    print("\n" + "=" * 90)
    print(f"Successful policies : {len(successful_policies)}")
    print(f"Failed checks       : {len(failed_checks)}")


    if failed_checks:
        print("\nFailed check details:")
        for check_ref, reason in failed_checks:
            print(f" - {check_ref}")
            print(f"   Reason: {reason}")

    print("=" * 90)

    sys.exit(final_exit_code)


if __name__ == "__main__":
    main()