"""Unit tests for the pure helpers in scripts/content_analysis/run_pde.py."""

import sys
from pathlib import Path

project_root = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(project_root))

from scripts.content_analysis import run_pde


def test_parse_policy_package(tmp_path):
    f = tmp_path / "p.rego"
    f.write_text("package foo.bar.baz\n\nimport data.terraform.helpers\n")
    assert run_pde.parse_policy_package(f) == "foo.bar.baz"


def test_flatten():
    assert run_pde.flatten(["a", ["b", ["c", "d"]]]) == ["a", "b", "c", "d"]


def test_get_resources_collects_labels_and_identifiers():
    plan = {
        "planned_values": {"root_module": {"resources": [
            {"name": "compliant_example_1", "values": {"display_name": "Compliant Example"}},
            {"name": "non_compliant_example_1", "values": {"display_name": "Non Compliant Example"}},
        ]}},
    }
    resources = run_pde.get_resources(plan)
    assert {r["label"] for r in resources} == {"compliant_example_1", "non_compliant_example_1"}
    all_idents = {i for r in resources for i in r["identifiers"]}
    assert "Compliant Example" in all_idents
    assert "non_compliant_example_1" in all_idents
