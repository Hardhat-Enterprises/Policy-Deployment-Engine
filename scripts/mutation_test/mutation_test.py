from __future__ import annotations

import argparse
import sys
from pathlib import Path


REPO_ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(REPO_ROOT))


from scripts.mutation_test.report import write_json_report
from scripts.mutation_test.resource_runner import (
    discover_all_policy_targets,
    discover_policy_targets,
    run_single_policy,
)


def parse_args():
    parser = argparse.ArgumentParser(
        description=(
            "Mutation test PDE Rego policies using "
            "committed Terraform plan fixtures."
        )
    )

    parser.add_argument(
        "target",
        nargs="?",
        help=(
            "Resource or individual policy path. "
            "Not required when --all is used."
        ),
    )

    parser.add_argument(
        "--all",
        dest="all_policies",
        action="store_true",
        help=(
            "Run mutation testing across every PDE policy "
            "that has a matching committed plan fixture."
        ),
    )

    parser.add_argument(
        "--report",
        help=(
            "Optional path for a machine readable "
            "JSON mutation report."
        ),
    )

    args = parser.parse_args()

    if args.all_policies and args.target:
        parser.error(
            "target cannot be used together with --all"
        )

    if not args.all_policies and not args.target:
        parser.error(
            "target is required unless --all is used"
        )

    return args


def is_policy_target(target: Path) -> bool:
    """
    Determine whether the supplied target identifies
    one individual PDE policy.
    """

    policy_file = (
        REPO_ROOT
        / "policies"
        / target.parent
        / f"{target.name}.rego"
    )

    fixture_dir = (
        REPO_ROOT
        / "inputs"
        / target
    )

    return (
        policy_file.is_file()
        and fixture_dir.is_dir()
    )


def print_policy_result(result: dict) -> None:
    """
    Print one policy's mutation results.
    """

    print()
    print(f"Policy: {result['policy']}")

    if result.get("error"):
        print(
            f"  [ERROR] {result['error']}"
        )
        return

    if result.get("unsupported"):
        print(
            "  [UNSUPPORTED] "
            "Custom or non standard PDE policy structure."
        )

        print(
            "  Reason: "
            f"{result.get('unsupported_reason', 'Unknown')}"
        )

        return

    for mutant in result["mutants"]:
        print()

        print(
            f"  Mutation {mutant['number']}"
        )

        print(
            f"    Policy type : "
            f"{mutant['policy_type']}"
        )

        print(
            f"    Path        : "
            f"{mutant['attribute_path']}"
        )

        print(
            f"    Condition   : "
            f"{mutant['condition']}"
        )

        if "operator" in mutant:
            print(
                f"    Operator    : "
                f"{mutant['operator']}"
            )

        if "original_value" in mutant:
            print(
                f"    Before      : "
                f"{mutant['original_value']}"
            )

        if "mutated_value" in mutant:
            print(
                f"    After       : "
                f"{mutant['mutated_value']}"
            )

        if "new_failures" in mutant:
            print(
                f"    New failures: "
                f"{mutant['new_failures']}"
            )

        print(
            f"    Result      : "
            f"{mutant['status']}"
        )

        if mutant.get("reason"):
            print(
                f"    Reason      : "
                f"{mutant['reason']}"
            )

    print()

    print(
        f"  Killed   : {result['killed']}"
    )

    print(
        f"  Survived : {result['survived']}"
    )

    print(
        f"  Skipped  : {result['skipped']}"
    )

    score = result.get("score")

    if score is None:
        print(
            "  Score    : N/A"
        )

    else:
        print(
            f"  Score    : {score:.1f}%"
        )


def main() -> int:
    args = parse_args()

    print(
        "PDE Policy Mutation Testing"
    )

    if args.all_policies:
        target_label = "ALL"

        print(
            "Target: ALL"
        )

        print(
            "Mode  : repository"
        )

        try:
            targets = discover_all_policy_targets(
                REPO_ROOT,
            )

        except ValueError as error:
            print(
                f"[ERROR] {error}"
            )

            return 1

    else:
        target = Path(
            args.target
        )

        target_label = args.target

        print(
            f"Target: {args.target}"
        )

        if is_policy_target(target):
            targets = [target]

            print(
                "Mode  : single policy"
            )

        else:
            print(
                "Mode  : resource"
            )

            try:
                targets = discover_policy_targets(
                    REPO_ROOT,
                    target,
                )

            except ValueError as error:
                print(
                    f"[ERROR] {error}"
                )

                return 1

    if not targets:
        print(
            "[ERROR] No mutation testable "
            "policies were discovered."
        )

        return 1

    print(
        f"Discovered policies: {len(targets)}"
    )

    policy_results = []

    for number, policy_target in enumerate(
        targets,
        start=1,
    ):
        if args.all_policies:
            print()
            print(
                f"Running policy "
                f"{number} of {len(targets)}"
            )

        result = run_single_policy(
            REPO_ROOT,
            policy_target,
        )

        policy_results.append(
            result
        )

        print_policy_result(
            result
        )

    killed = sum(
        result.get(
            "killed",
            0,
        )
        for result in policy_results
    )

    survived = sum(
        result.get(
            "survived",
            0,
        )
        for result in policy_results
    )

    skipped = sum(
        result.get(
            "skipped",
            0,
        )
        for result in policy_results
    )

    errors = sum(
        1
        for result in policy_results
        if result.get("error")
    )

    unsupported = sum(
        1
        for result in policy_results
        if result.get("unsupported")
    )

    compatible = (
        len(policy_results)
        - errors
        - unsupported
    )

    tested = (
        killed
        + survived
    )

    if tested:
        overall_score = round(
            killed / tested * 100,
            2,
        )

    else:
        overall_score = None

    summary = {
        "target": target_label,
        "mode": (
            "repository"
            if args.all_policies
            else "target"
        ),
        "policies_discovered": len(targets),
        "mutation_compatible_policies": compatible,
        "unsupported_policies": unsupported,
        "policies_with_errors": errors,
        "killed": killed,
        "survived": survived,
        "skipped": skipped,
        "score": overall_score,
        "policies": policy_results,
    }

    print()

    if args.all_policies:
        print(
            "Repository Mutation Summary"
        )

        print(
            "==========================="
        )

    else:
        print(
            "Overall Mutation Summary"
        )

        print(
            "========================"
        )

    print(
        f"Policies discovered : "
        f"{len(targets)}"
    )

    print(
        f"Compatible          : "
        f"{compatible}"
    )

    print(
        f"Unsupported         : "
        f"{unsupported}"
    )

    print(
        f"Killed              : "
        f"{killed}"
    )

    print(
        f"Survived            : "
        f"{survived}"
    )

    print(
        f"Skipped             : "
        f"{skipped}"
    )

    print(
        f"Errors              : "
        f"{errors}"
    )

    if overall_score is None:
        print(
            "Mutation score      : N/A"
        )

    else:
        print(
            f"Mutation score      : "
            f"{overall_score:.1f}%"
        )

    if args.report:
        report_path = Path(
            args.report
        )

        write_json_report(
            summary,
            report_path,
        )

        print()

        print(
            f"JSON report written to: "
            f"{report_path}"
        )

    if survived or errors:
        return 2

    return 0


if __name__ == "__main__":
    raise SystemExit(
        main()
    )