from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path


REPO_ROOT = Path(__file__).resolve().parents[2]

sys.path.insert(
    0,
    str(REPO_ROOT),
)


from scripts.mutation_test.evaluator import (
    evaluate_plan,
    extract_non_compliant_resources,
)

from scripts.mutation_test.metadata import (
    extract_mutation_specs,
    get_package_name,
    get_policy_conditions,
)

from scripts.mutation_test.mutators import (
    get_nested_value,
    set_nested_value,
)


def parse_args():
    parser = argparse.ArgumentParser(
        description=(
            "Mutation test a PDE policy using its "
            "committed Terraform fixture."
        )
    )

    parser.add_argument(
        "policy",
        help=(
            "Policy path relative to the platform. "
            "Example: "
            "'gcp/API Hub/"
            "google_apihub_curation/"
            "deletion_policy'"
        ),
    )

    return parser.parse_args()


def find_resource(
    resources: list,
    name: str,
):
    """
    Find a Terraform resource in planned_values by Terraform label.
    """
    for index, resource in enumerate(
        resources
    ):
        if resource.get("name") == name:
            return index, resource

    return None, None


def load_plan(
    fixture_dir: Path,
):
    """
    Load the single committed Terraform plan JSON from a fixture.
    """
    plan_files = list(
        fixture_dir.glob("*.json")
    )

    if len(plan_files) != 1:
        raise ValueError(
            "Expected exactly one committed plan "
            f"in {fixture_dir}, "
            f"found {len(plan_files)}"
        )

    plan_path = plan_files[0]

    plan = json.loads(
        plan_path.read_text(
            encoding="utf-8"
        )
    )

    return plan_path, plan


def main() -> int:
    args = parse_args()

    relative = Path(
        args.policy
    )

    fixture_dir = (
        REPO_ROOT
        / "inputs"
        / relative
    )

    policy_file = (
        REPO_ROOT
        / "policies"
        / relative.parent
        / f"{relative.name}.rego"
    )

    if not fixture_dir.is_dir():
        print(
            "[ERROR] Fixture directory "
            f"not found: {fixture_dir}"
        )
        return 1

    if not policy_file.is_file():
        print(
            "[ERROR] Policy file "
            f"not found: {policy_file}"
        )
        return 1

    try:
        plan_path, plan = load_plan(
            fixture_dir
        )

    except ValueError as error:
        print(
            f"[ERROR] {error}"
        )
        return 1

    conditions = get_policy_conditions(
        policy_file,
        plan_path,
        REPO_ROOT,
    )

    specs = extract_mutation_specs(
        conditions
    )

    if not specs:
        print(
            "[ERROR] No mutation compatible "
            "policy conditions found."
        )
        return 1

    try:
        resources = (
            plan
            ["planned_values"]
            ["root_module"]
            ["resources"]
        )

    except KeyError:
        print(
            "[ERROR] Terraform plan does not "
            "contain planned resources."
        )
        return 1

    compliant_index, compliant = (
        find_resource(
            resources,
            "compliant_example_1",
        )
    )

    _, non_compliant = (
        find_resource(
            resources,
            "non_compliant_example_1",
        )
    )

    if compliant is None:
        print(
            "[ERROR] compliant_example_1 "
            "was not found."
        )
        return 1

    if non_compliant is None:
        print(
            "[ERROR] non_compliant_example_1 "
            "was not found."
        )
        return 1

    package = get_package_name(
        policy_file
    )

    details_query = (
        f"data.{package}.details"
    )

    print(
        "PDE Policy Mutation Testing"
    )

    print(
        f"Policy: {args.policy}"
    )

    print()

    killed = 0
    survived = 0
    skipped = 0

    for number, spec in enumerate(
        specs,
        start=1,
    ):
        print(
            f"Mutation {number}"
        )

        print(
            f"  Policy type    : "
            f"{spec.policy_type}"
        )

        print(
            f"  Attribute path : "
            f"{spec.attribute_path}"
        )

        print(
            f"  Policy values  : "
            f"{spec.values}"
        )

        print(
            f"  Condition      : "
            f"{spec.condition}"
        )

        try:
            original_value = (
                get_nested_value(
                    compliant["values"],
                    spec.attribute_path,
                )
            )

            bad_value = (
                get_nested_value(
                    non_compliant["values"],
                    spec.attribute_path,
                )
            )

        except (
            KeyError,
            IndexError,
            TypeError,
        ):
            print(
                "  [SKIPPED] Attribute path "
                "could not be resolved."
            )

            skipped += 1

            print()

            continue

        if original_value == bad_value:
            print(
                "  [SKIPPED] Compliant and "
                "non compliant fixture values "
                "are identical."
            )

            skipped += 1

            print()

            continue

        print(
            f"  Original value  : "
            f"{original_value}"
        )

        print(
            f"  Mutated value   : "
            f"{bad_value}"
        )

        full_path = [
            "planned_values",
            "root_module",
            "resources",
            compliant_index,
            "values",
            *spec.attribute_path,
        ]

        mutated_plan = (
            set_nested_value(
                plan,
                full_path,
                bad_value,
            )
        )

        baseline_details = (
            evaluate_plan(
                plan,
                policy_file.parent,
                details_query,
                REPO_ROOT,
            )
        )

        mutated_details = (
            evaluate_plan(
                mutated_plan,
                policy_file.parent,
                details_query,
                REPO_ROOT,
            )
        )

        baseline_failures = (
            extract_non_compliant_resources(
                baseline_details
            )
        )

        mutated_failures = (
            extract_non_compliant_resources(
                mutated_details
            )
        )

        new_failures = (
            mutated_failures
            - baseline_failures
        )

        print(
            "  Baseline failures : "
            f"{sorted(baseline_failures)}"
        )

        print(
            "  Mutated failures  : "
            f"{sorted(mutated_failures)}"
        )

        print(
            "  New failures      : "
            f"{sorted(new_failures)}"
        )

        if new_failures:
            print(
                "  [KILLED] Policy detected "
                "the mutation."
            )

            killed += 1

        else:
            print(
                "  [SURVIVED] Mutation "
                "escaped detection."
            )

            survived += 1

        print()

    tested = (
        killed
        + survived
    )

    print(
        "Mutation Summary"
    )

    print(
        "----------------"
    )

    print(
        f"Killed   : {killed}"
    )

    print(
        f"Survived : {survived}"
    )

    print(
        f"Skipped  : {skipped}"
    )

    if tested:
        score = (
            killed
            / tested
        ) * 100

        print(
            f"Score    : {score:.1f}%"
        )

    else:
        print(
            "Score    : N/A"
        )

    if survived:
        return 2

    return 0


if __name__ == "__main__":
    raise SystemExit(
        main()
    )