import json
import sys
from pathlib import Path

import pytest

from scripts.mutation_test import mutation_test as cli


def test_parse_args_accepts_target_and_report(
    monkeypatch,
):
    monkeypatch.setattr(
        sys,
        "argv",
        [
            "mutation_test.py",
            "gcp/example/resource",
            "--report",
            "report.json",
        ],
    )

    args = cli.parse_args()

    assert args.target == "gcp/example/resource"
    assert args.report == "report.json"


def test_is_policy_target_detects_real_policy():
    target = Path(
        "gcp/API Hub/"
        "google_apihub_curation/"
        "deletion_policy"
    )

    assert cli.is_policy_target(target) is True


def test_resource_path_is_not_individual_policy():
    target = Path(
        "gcp/API Hub/"
        "google_apihub_curation"
    )

    assert cli.is_policy_target(target) is False


@pytest.mark.integration
def test_main_single_policy_writes_json_report(
    monkeypatch,
    tmp_path,
    capsys,
):
    target = (
        "gcp/API Hub/"
        "google_apihub_curation/"
        "deletion_policy"
    )

    report_path = (
        tmp_path
        / "mutation-report.json"
    )

    monkeypatch.setattr(
        sys,
        "argv",
        [
            "mutation_test.py",
            target,
            "--report",
            str(report_path),
        ],
    )

    exit_code = cli.main()

    output = capsys.readouterr().out

    assert exit_code == 0

    assert (
        "PDE Policy Mutation Testing"
        in output
    )

    assert (
        "Mode  : single policy"
        in output
    )

    assert (
        "Result      : KILLED"
        in output
    )

    assert (
        "Mutation score      : 100.0%"
        in output
    )

    assert report_path.is_file()

    report = json.loads(
        report_path.read_text(
            encoding="utf-8"
        )
    )

    assert report["killed"] == 1
    assert report["survived"] == 0
    assert report["score"] == 100.0

    assert (
        report["mutation_compatible_policies"]
        == 1
    )


@pytest.mark.integration
def test_main_resource_target_reports_unsupported_policy(
    monkeypatch,
    capsys,
):
    target = (
        "gcp/API Hub/"
        "google_apihub_curation"
    )

    monkeypatch.setattr(
        sys,
        "argv",
        [
            "mutation_test.py",
            target,
        ],
    )

    exit_code = cli.main()

    output = capsys.readouterr().out

    assert exit_code == 0

    assert (
        "Mode  : resource"
        in output
    )

    assert (
        "Discovered policies: 3"
        in output
    )

    assert (
        "Unsupported         : 1"
        in output
    )

    assert (
        "[UNSUPPORTED]"
        in output
    )


def test_main_returns_two_when_mutant_survives(
    monkeypatch,
    capsys,
):
    target = "gcp/example/resource/policy"

    fake_result = {
        "policy": target,
        "killed": 0,
        "survived": 1,
        "skipped": 0,
        "score": 0.0,
        "mutants": [
            {
                "number": 1,
                "policy_type": "whitelist",
                "attribute_path": [
                    "example"
                ],
                "condition": (
                    "Example condition"
                ),
                "operator": (
                    "whitelist-outside-allowlist"
                ),
                "original_value": "SAFE",
                "mutated_value": "BAD",
                "new_failures": [],
                "status": "SURVIVED",
            }
        ],
    }

    monkeypatch.setattr(
        sys,
        "argv",
        [
            "mutation_test.py",
            target,
        ],
    )

    monkeypatch.setattr(
        cli,
        "is_policy_target",
        lambda _: True,
    )

    monkeypatch.setattr(
        cli,
        "run_single_policy",
        lambda *_: fake_result,
    )

    exit_code = cli.main()

    output = capsys.readouterr().out

    assert exit_code == 2

    assert (
        "Result      : SURVIVED"
        in output
    )

    assert (
        "Survived            : 1"
        in output
    )

    assert (
        "Mutation score      : 0.0%"
        in output
    )