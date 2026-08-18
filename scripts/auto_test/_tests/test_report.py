"""Unit tests for the --report machine-readable output of auto_test."""

import json
import sys
from pathlib import Path

project_root = Path(__file__).parent.parent.parent.parent
sys.path.insert(0, str(project_root))

from scripts.auto_test import auto_test


def test_write_report_emits_valid_json_array_with_failures(tmp_path):
    # A mixed results list, exactly as main() accumulates it from
    # make_success/make_failure — including a nested dotted leaf-key policy name.
    results = [
        auto_test.make_success("storage_class", "Cloud Storage", "google_storage_bucket"),
        auto_test.make_failure("autoclass.enabled", "Non-compliant resources were not flagged",
                               "Cloud Storage", "google_storage_bucket"),
    ]
    report = tmp_path / "policy_results.json"
    auto_test.write_report(results, str(report))

    data = json.loads(report.read_text())
    assert isinstance(data, list)
    assert len(data) == 2

    # Every entry has the four canonical keys with the right types.
    for entry in data:
        assert {"service", "resource", "policy", "passed"} <= set(entry)
        assert isinstance(entry["passed"], bool)

    # The report must retain at least one failing entry, with names left verbatim.
    failing = [e for e in data if e["passed"] is False]
    assert failing, "report must include the passed: false entries"
    assert failing[0]["service"] == "Cloud Storage"          # display name, unchanged
    assert failing[0]["resource"] == "google_storage_bucket"  # full google_* type
    assert failing[0]["policy"] == "autoclass.enabled"        # dotted leaf-key, unchanged
    # Extra keys already on failure entries are preserved.
    assert failing[0]["failure"]["reason"] == "Non-compliant resources were not flagged"
