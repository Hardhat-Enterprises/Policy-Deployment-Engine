from __future__ import annotations

import json
import tempfile
from pathlib import Path

from scripts.auto_test.auto_test import opa_eval_value


def evaluate_plan(
    plan: dict,
    policy_dir: Path,
    query: str,
    repo_root: Path,
):
    """
    Evaluate an in memory Terraform plan against real PDE Rego policies.

    The mutated plan is written only to a temporary JSON file.
    Repository plan files are never modified.
    """
    helpers_dir = repo_root / "policies" / "_helpers"

    with tempfile.NamedTemporaryFile(
        mode="w",
        suffix=".json",
        encoding="utf-8",
        delete=False,
    ) as handle:
        json.dump(plan, handle)
        temp_plan = Path(handle.name)

    try:
        return opa_eval_value(
            [
                helpers_dir,
                policy_dir,
            ],
            temp_plan,
            query,
        )

    finally:
        temp_plan.unlink(missing_ok=True)


def extract_non_compliant_resources(details) -> set[str]:
    """
    Extract exact non compliant resource identifiers from PDE structured
    policy details.

    This avoids unreliable string matching against policy messages.
    """
    resources: set[str] = set()

    if not isinstance(details, list):
        return resources

    for situation in details:
        if not isinstance(situation, dict):
            continue

        failing = situation.get(
            "non_compliant_resources",
            [],
        )

        if isinstance(failing, list):
            resources.update(
                str(item)
                for item in failing
            )

        elif isinstance(failing, str):
            resources.add(failing)

    return resources