from __future__ import annotations

import re
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from scripts.auto_test.auto_test import opa_eval_value


PACKAGE_RE = re.compile(
    r"^\s*package\s+([A-Za-z0-9_.]+)\s*$",
    re.MULTILINE,
)


@dataclass(frozen=True)
class MutationSpec:
    policy_type: str
    attribute_path: list[Any]
    values: list[Any]
    condition: str


def get_package_name(
    policy_file: Path,
) -> str:
    """
    Read the Rego package declaration from a policy file.
    """
    text = policy_file.read_text(
        encoding="utf-8"
    )

    match = PACKAGE_RE.search(text)

    if not match:
        raise ValueError(
            "Could not determine Rego package "
            f"from {policy_file}"
        )

    return match.group(1)


def get_policy_conditions(
    policy_file: Path,
    plan_path: Path,
    repo_root: Path,
):
    """
    Ask OPA for the policy's conditions object.

    This allows mutation testing to discover policy metadata rather
    than hard coding policy types, paths or values.
    """
    package = get_package_name(
        policy_file
    )

    query = (
        f"data.{package}.conditions"
    )

    helpers_dir = (
        repo_root
        / "policies"
        / "_helpers"
    )

    return opa_eval_value(
        [
            helpers_dir,
            policy_file.parent,
        ],
        plan_path,
        query,
    )


def extract_mutation_specs(
    conditions,
) -> list[MutationSpec]:
    """
    Convert PDE condition objects into mutation specifications.
    """
    specs: list[MutationSpec] = []

    if not isinstance(
        conditions,
        list,
    ):
        return specs

    for situation in conditions:

        if not isinstance(
            situation,
            list,
        ):
            continue

        for entry in situation:

            if not isinstance(
                entry,
                dict,
            ):
                continue

            policy_type = entry.get(
                "policy_type"
            )

            if not isinstance(
                policy_type,
                str,
            ):
                continue

            attribute_path = entry.get(
                "attribute_path"
            )

            values = entry.get(
                "values"
            )

            condition = entry.get(
                "condition",
                "",
            )

            if not isinstance(
                attribute_path,
                list,
            ):
                continue

            if not isinstance(
                values,
                list,
            ):
                continue

            specs.append(
                MutationSpec(
                    policy_type=policy_type.lower(),
                    attribute_path=attribute_path,
                    values=values,
                    condition=str(condition),
                )
            )

    return specs