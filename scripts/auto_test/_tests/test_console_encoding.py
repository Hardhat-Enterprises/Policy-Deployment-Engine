"""auto_test must survive a stdout that cannot encode its own summary line.

A Windows console on a legacy code page (cp1252) cannot encode ✅ or ❌, so the
summary print raised UnicodeEncodeError at the moment a run
passed: the process exited non-zero and check_resource.py reported a passing
resource as failed. These tests drive main() to each summary with stdout and
stderr wrapped exactly as that console presents them.
"""

import io
import sys
from pathlib import Path

import pytest

project_root = Path(__file__).parent.parent.parent.parent
sys.path.insert(0, str(project_root))

from scripts.auto_test import auto_test


def cp1252_stream():
    return io.TextIOWrapper(io.BytesIO(), encoding="cp1252")


def written(stream):
    stream.flush()
    return stream.buffer.getvalue().decode("utf-8")


@pytest.fixture
def run_main(monkeypatch, tmp_path):
    """main() over one fake pair whose plan is already cached, on a cp1252 console."""
    plan = tmp_path / "plan.json"
    plan.write_text('{"planned_values": {}}')
    directory = Path("policies/gcp/Cloud Storage/google_storage_bucket/storage_class")
    pair = (directory, directory / "policy.rego")

    def run(result):
        monkeypatch.setattr(auto_test, "discover_policies", lambda *_: ([pair], []))
        monkeypatch.setattr(auto_test, "plan_cache_path", lambda _: plan)
        monkeypatch.setattr(auto_test, "adopt_denormalised_plan", lambda *_: False)
        monkeypatch.setattr(auto_test, "run_policy_check_pair", lambda *_: result)
        monkeypatch.setattr(sys, "argv", ["auto_test.py"])
        stdout, stderr = cp1252_stream(), cp1252_stream()
        monkeypatch.setattr(sys, "stdout", stdout)
        monkeypatch.setattr(sys, "stderr", stderr)
        return stdout

    return run


def test_the_console_really_cannot_encode_the_summary():
    # The premise: without the guard, this is the crash the student saw.
    with pytest.raises(UnicodeEncodeError):
        print("✅ all passed", file=cp1252_stream(), flush=True)


def test_passing_summary_prints_and_returns_normally(run_main):
    stdout = run_main(auto_test.make_success(
        "storage_class", "Cloud Storage", "google_storage_bucket"))

    auto_test.main()        # a pass returns; it does not raise or sys.exit

    assert "✅ all passed — 1 service, 1 resource type, 1 policy" in written(stdout)


def test_failure_summary_prints_and_still_exits_1(run_main):
    stdout = run_main(auto_test.make_failure(
        "storage_class", "Non-compliant resources were not flagged",
        "Cloud Storage", "google_storage_bucket"))

    with pytest.raises(SystemExit) as exit_info:
        auto_test.main()

    assert exit_info.value.code == 1
    out = written(stdout)
    assert "  ❌ Cloud Storage / google_storage_bucket / storage_class" in out
    assert "❌ 1 FAILED — 1 service, 1 resource type, 1 policy" in out


def test_a_stream_without_reconfigure_is_left_alone(monkeypatch):
    stream = io.StringIO()
    monkeypatch.setattr(sys, "stdout", stream)
    monkeypatch.setattr(sys, "stderr", stream)

    auto_test.make_streams_encoding_safe()

    assert sys.stdout is stream
