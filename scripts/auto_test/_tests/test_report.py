"""Unit tests for the --report machine-readable output of auto_test."""

import json
import sys
from pathlib import Path
import pytest

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


def test_main_reports_malformed_dotted_argument_before_failure(tmp_path, monkeypatch):
    directory = Path("policies/gcp/Cloud Storage/google_storage_bucket/autoclass.enabled")
    report = tmp_path / "report.json"
    monkeypatch.setattr(auto_test, "discover_policies", lambda *_: ([], [(directory, "missing compliant.tf")]))
    monkeypatch.setattr(sys, "argv", ["auto_test.py", "gcp", "--report", str(report)])
    with pytest.raises(SystemExit) as error:
        auto_test.main()
    assert error.value.code == 1
    result, = json.loads(report.read_text())
    assert result == auto_test.make_failure("autoclass.enabled", "missing compliant.tf",
                                           "Cloud Storage", "google_storage_bucket")


def test_no_discovered_policies_still_emits_empty_report(tmp_path, monkeypatch):
    report = tmp_path / "report.json"
    monkeypatch.setattr(auto_test, "discover_policies", lambda *_: ([], []))
    monkeypatch.setattr(sys, "argv", ["auto_test.py", "gcp", "--report", str(report)])
    with pytest.raises(SystemExit) as error:
        auto_test.main()
    assert error.value.code == 1
    assert json.loads(report.read_text()) == []


def test_provider_setup_failure_still_emits_failure_report(tmp_path, monkeypatch):
    directory = Path("policies/gcp/Cloud Storage/google_storage_bucket/autoclass.enabled")
    report = tmp_path / "report.json"
    monkeypatch.setattr(auto_test, "discover_policies", lambda *_: ([(directory, directory / "policy.rego")], []))
    monkeypatch.setattr(auto_test, "plan_cache_path", lambda *_: tmp_path / "missing.json")
    monkeypatch.setattr(auto_test, "adopt_denormalised_plan", lambda *_: False)
    def fail_setup(*_):
        raise SystemExit("setup failed")
    monkeypatch.setattr(auto_test, "ensure_cache_ready", fail_setup)
    monkeypatch.setattr(sys, "argv", ["auto_test.py", "gcp", "--report", str(report)])
    with pytest.raises(SystemExit):
        auto_test.main()
    result, = json.loads(report.read_text())
    assert result["policy"] == "autoclass.enabled"
    assert result["passed"] is False
    assert "setup failed" in result["failure"]["reason"]
