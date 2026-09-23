from pathlib import Path

from scripts.mutation_test.resource_runner import (
    discover_policy_targets,
    find_resource,
    load_plan,
)


def test_find_resource_returns_exact_match():
    resources = [
        {
            "name": "compliant_example_1",
            "values": {},
        },
        {
            "name": "non_compliant_example_1",
            "values": {},
        },
    ]

    index, resource = find_resource(
        resources,
        "compliant_example_1",
    )

    assert index == 0
    assert resource["name"] == "compliant_example_1"


def test_find_resource_missing():
    index, resource = find_resource(
        [],
        "missing_resource",
    )

    assert index is None
    assert resource is None


def test_discover_policy_targets(tmp_path):
    resource_path = Path(
        "gcp/Test Service/google_test_resource"
    )

    fixture_dir = (
        tmp_path
        / "inputs"
        / resource_path
        / "secure_setting"
    )

    policy_dir = (
        tmp_path
        / "policies"
        / resource_path
    )

    fixture_dir.mkdir(
        parents=True
    )

    policy_dir.mkdir(
        parents=True
    )

    (
        fixture_dir
        / "fixture.json"
    ).write_text(
        "{}",
        encoding="utf-8",
    )

    (
        policy_dir
        / "secure_setting.rego"
    ).write_text(
        "package test",
        encoding="utf-8",
    )

    targets = discover_policy_targets(
        tmp_path,
        resource_path,
    )

    assert targets == [
        resource_path / "secure_setting"
    ]


def test_load_plan(tmp_path):
    fixture_dir = (
        tmp_path
        / "fixture"
    )

    fixture_dir.mkdir()

    (
        fixture_dir
        / "abc.json"
    ).write_text(
        '{"planned_values": {"test": true}}',
        encoding="utf-8",
    )

    plan_path, plan = load_plan(
        fixture_dir
    )

    assert plan_path.name == "abc.json"
    assert plan["planned_values"]["test"] is True