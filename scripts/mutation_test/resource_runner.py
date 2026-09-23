from __future__ import annotations

import json
from pathlib import Path
from typing import Any

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


def discover_policy_targets(
    repo_root: Path,
    resource_path: Path,
) -> list[Path]:
    """
    Discover all mutation-testable policy fixture directories
    belonging to one PDE resource.
    """

    input_root = (
        repo_root
        / "inputs"
        / resource_path
    )

    policy_root = (
        repo_root
        / "policies"
        / resource_path
    )

    if not input_root.is_dir():
        raise ValueError(
            f"Input resource directory not found: {input_root}"
        )

    if not policy_root.is_dir():
        raise ValueError(
            f"Policy resource directory not found: {policy_root}"
        )

    targets: list[Path] = []

    for fixture_dir in sorted(
        input_root.iterdir()
    ):
        if not fixture_dir.is_dir():
            continue

        policy_file = (
            policy_root
            / f"{fixture_dir.name}.rego"
        )

        if not policy_file.is_file():
            continue

        if not list(
            fixture_dir.glob("*.json")
        ):
            continue

        targets.append(
            resource_path
            / fixture_dir.name
        )

    return targets


def find_resource(
    resources: list[dict[str, Any]],
    terraform_name: str,
):
    """
    Find a resource in planned_values using its Terraform label.
    """

    for index, resource in enumerate(
        resources
    ):
        if resource.get("name") == terraform_name:
            return index, resource

    return None, None


def load_plan(
    fixture_dir: Path,
):
    """
    Load the single committed Terraform plan JSON
    belonging to a fixture.
    """

    plan_files = list(
        fixture_dir.glob("*.json")
    )

    if len(plan_files) != 1:
        raise ValueError(
            f"Expected exactly one committed plan in "
            f"{fixture_dir}; found {len(plan_files)}"
        )

    plan_path = plan_files[0]

    plan = json.loads(
        plan_path.read_text(
            encoding="utf-8"
        )
    )

    return plan_path, plan


def run_single_policy(
    repo_root: Path,
    policy_path: Path,
) -> dict[str, Any]:
    """
    Mutation-test one PDE policy and return structured results.
    """

    fixture_dir = (
        repo_root
        / "inputs"
        / policy_path
    )

    policy_file = (
        repo_root
        / "policies"
        / policy_path.parent
        / f"{policy_path.name}.rego"
    )

    result: dict[str, Any] = {
        "policy": policy_path.as_posix(),
        "killed": 0,
        "survived": 0,
        "skipped": 0,
        "mutants": [],
    }

    # ---------------------------------------------------------
    # Basic path validation
    # ---------------------------------------------------------

    if not fixture_dir.is_dir():
        result["error"] = (
            f"Fixture directory not found: {fixture_dir}"
        )
        return result

    if not policy_file.is_file():
        result["error"] = (
            f"Policy file not found: {policy_file}"
        )
        return result

    # ---------------------------------------------------------
    # Load committed Terraform plan
    # ---------------------------------------------------------

    try:
        plan_path, plan = load_plan(
            fixture_dir
        )

    except (
        ValueError,
        OSError,
        json.JSONDecodeError,
    ) as error:
        result["error"] = str(error)
        return result

    # ---------------------------------------------------------
    # Discover policy metadata
    # ---------------------------------------------------------

    try:
        conditions = get_policy_conditions(
            policy_file,
            plan_path,
            repo_root,
        )

        specs = extract_mutation_specs(
            conditions
        )

    except Exception as error:
        result["error"] = (
            "Could not read policy metadata: "
            f"{error}"
        )
        return result

    # Custom/non-standard Rego policy.
    if not specs:
        result["unsupported"] = True

        result["unsupported_reason"] = (
            "Policy does not expose standard PDE mutation metadata "
            "through conditions. It may use custom Rego evaluation logic."
        )

        result["score"] = None

        return result

    # ---------------------------------------------------------
    # Read planned resources
    # ---------------------------------------------------------

    try:
        resources = (
            plan
            ["planned_values"]
            ["root_module"]
            ["resources"]
        )

    except KeyError:
        result["error"] = (
            "Terraform plan does not contain "
            "planned_values.root_module.resources."
        )
        return result

    # ---------------------------------------------------------
    # Locate baseline fixtures
    # ---------------------------------------------------------

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
        result["error"] = (
            "compliant_example_1 was not found."
        )
        return result

    if non_compliant is None:
        result["error"] = (
            "non_compliant_example_1 was not found."
        )
        return result

    # ---------------------------------------------------------
    # Build structured OPA details query
    # ---------------------------------------------------------

    try:
        package = get_package_name(
            policy_file
        )

    except ValueError as error:
        result["error"] = str(error)
        return result

    details_query = (
        f"data.{package}.details"
    )

    # ---------------------------------------------------------
    # Evaluate original baseline
    # ---------------------------------------------------------

    baseline_details = evaluate_plan(
        plan,
        policy_file.parent,
        details_query,
        repo_root,
    )

    baseline_failures = (
        extract_non_compliant_resources(
            baseline_details
        )
    )

    # ---------------------------------------------------------
    # Generate and evaluate mutants
    # ---------------------------------------------------------

    for number, spec in enumerate(
        specs,
        start=1,
    ):
        mutant: dict[str, Any] = {
            "number": number,
            "policy_type": spec.policy_type,
            "attribute_path": spec.attribute_path,
            "policy_values": spec.values,
            "condition": spec.condition,
        }

        try:
            original_value = (
                get_nested_value(
                    compliant["values"],
                    spec.attribute_path,
                )
            )

            mutated_value = (
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
            mutant["status"] = "SKIPPED"

            mutant["reason"] = (
                "Attribute path could not be resolved."
            )

            result["skipped"] += 1
            result["mutants"].append(
                mutant
            )

            continue

        mutant["original_value"] = (
            original_value
        )

        mutant["mutated_value"] = (
            mutated_value
        )

        if original_value == mutated_value:
            mutant["status"] = "SKIPPED"

            mutant["reason"] = (
                "Compliant and non-compliant fixture "
                "values are identical."
            )

            result["skipped"] += 1
            result["mutants"].append(
                mutant
            )

            continue

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
                mutated_value,
            )
        )

        mutated_details = (
            evaluate_plan(
                mutated_plan,
                policy_file.parent,
                details_query,
                repo_root,
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

        mutant["baseline_failures"] = sorted(
            baseline_failures
        )

        mutant["mutated_failures"] = sorted(
            mutated_failures
        )

        mutant["new_failures"] = sorted(
            new_failures
        )

        if new_failures:
            mutant["status"] = "KILLED"

            result["killed"] += 1

        else:
            mutant["status"] = "SURVIVED"

            result["survived"] += 1

        result["mutants"].append(
            mutant
        )

    # ---------------------------------------------------------
    # Calculate mutation score
    # ---------------------------------------------------------

    tested = (
        result["killed"]
        + result["survived"]
    )

    if tested:
        result["score"] = round(
            (
                result["killed"]
                / tested
            )
            * 100,
            2,
        )

    else:
        result["score"] = None

    return result