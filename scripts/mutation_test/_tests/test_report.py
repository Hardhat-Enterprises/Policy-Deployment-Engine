import json

from scripts.mutation_test.report import (
    write_json_report,
)


def test_write_json_report(tmp_path):
    destination = (
        tmp_path
        / "mutation-report.json"
    )

    data = {
        "killed": 2,
        "survived": 1,
        "skipped": 0,
        "score": 66.67,
    }

    write_json_report(
        data,
        destination,
    )

    assert destination.exists()

    loaded = json.loads(
        destination.read_text(
            encoding="utf-8"
        )
    )

    assert loaded == data


def test_write_json_report_creates_parent_directory(
    tmp_path,
):
    destination = (
        tmp_path
        / "reports"
        / "mutation-report.json"
    )

    write_json_report(
        {"score": 100.0},
        destination,
    )

    assert destination.exists()