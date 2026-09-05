"""The docs content check that keeps cross-cutting assessments identical.

`location` / `region` / `zone`, and the common keys on the split IAM resources, mean
the same thing wherever they appear, so their assessment is decided once in
`scripts/docgen/lib/canonical.py` and written into every resource by the generator.
Left unchecked that drifted 14 ways; these tests pin the check that stops it.

Two properties matter as much as catching drift: an exempt resource must not be
reported for keeping its own (correct) answer, and the check must stay a CONTENT
check — the structural pass is a hard tree-wide gate on every pull request, and a
rule breakable by editing any one of ~400 docs files does not belong there.
"""

import json
import sys
from pathlib import Path

import pytest

project_root = Path(__file__).parent.parent.parent.parent
sys.path.insert(0, str(project_root))
sys.path.insert(0, str(project_root / "scripts" / "linters"))

import linter  # noqa: E402
from scripts.docgen.lib.canonical import (  # noqa: E402
    RESIDENCY_FIXED_RATIONALE,
    RESIDENCY_RATIONALE,
)


class Recorder:
    """Stands in for the linter's logger, keeping what it was told."""

    def __init__(self):
        self.lines = []

    def log(self, message):
        self.lines.append(message)


def _docs_tree(tmp_path, resource, arguments, service="Cloud Storage"):
    d = tmp_path / "docs" / "gcp" / service
    d.mkdir(parents=True, exist_ok=True)
    (d / f"{resource}.json").write_text(json.dumps({
        "last_updated": "2026-01-01T00:00:00Z",
        "provider_version": "7.37.0",
        "arguments": arguments,
    }, indent=2), encoding="utf-8")
    return tmp_path / "docs"


def _run(docs_root):
    log = Recorder()
    linter.DocsCanonicalValidator(str(docs_root), log).validate(only_platform="gcp")
    return log.lines


def _leaf(**over):
    entry = {"description": "d", "required": False, "type": "string",
             "security_impact": True, "rationale": RESIDENCY_RATIONALE}
    entry.update(over)
    return entry


def test_a_canonical_argument_that_matches_is_silent(tmp_path):
    root = _docs_tree(tmp_path, "google_storage_bucket", {"location": _leaf()})
    assert _run(root) == []


def test_a_rewritten_rationale_is_reported(tmp_path):
    root = _docs_tree(tmp_path, "google_storage_bucket",
                      {"location": _leaf(rationale="Because I said so.")})
    lines = _run(root)
    assert len(lines) == 1
    assert "canonical rationale" in lines[0]
    assert "apply_canonical.py --apply" in lines[0], "the fix must be in the message"
    assert "EXEMPTIONS" in lines[0], "so must the way out, or a real exception is stuck"


def test_a_flipped_security_impact_is_reported(tmp_path):
    root = _docs_tree(tmp_path, "google_storage_bucket",
                      {"location": _leaf(security_impact=False)})
    lines = _run(root)
    assert len(lines) == 1 and "canonical security_impact" in lines[0]


def test_both_fields_wrong_are_reported_separately(tmp_path):
    root = _docs_tree(tmp_path, "google_storage_bucket",
                      {"location": _leaf(security_impact=False, rationale="no")})
    assert len(_run(root)) == 2


def test_a_non_canonical_argument_is_not_this_check_s_business(tmp_path):
    root = _docs_tree(tmp_path, "google_storage_bucket",
                      {"uniform_bucket_level_access": _leaf(rationale="anything at all")})
    assert _run(root) == []


def test_a_block_argument_is_skipped(tmp_path):
    # A block carries no assessment of its own; only its leaves do.
    root = _docs_tree(tmp_path, "google_storage_bucket",
                      {"location": {"description": "d", "required": False, "type": "block"}})
    assert _run(root) == []


def test_an_exempt_resource_keeping_its_own_answer_is_silent(tmp_path):
    root = _docs_tree(tmp_path, "google_iam_folders_policy_binding",
                      {"location": _leaf(security_impact=False,
                                         rationale=RESIDENCY_FIXED_RATIONALE)},
                      service="Cloud IAM")
    assert _run(root) == []


def test_an_exempt_resource_given_the_generic_answer_is_reported(tmp_path):
    # The exemption locks a value; it does not stop being checked. Someone running
    # a blind overwrite would land the generic answer here, and that is wrong.
    root = _docs_tree(tmp_path, "google_iam_folders_policy_binding",
                      {"location": _leaf()}, service="Cloud IAM")
    assert len(_run(root)) == 2


def test_a_malformed_file_is_left_to_the_structural_validator(tmp_path):
    d = tmp_path / "docs" / "gcp" / "Cloud Storage"
    d.mkdir(parents=True)
    (d / "google_storage_bucket.json").write_text("{ not json", encoding="utf-8")
    assert _run(tmp_path / "docs") == []


@pytest.mark.parametrize("value,expected_in", [
    ("short", "short"),
    ("x" * 200, "…"),
])
def test_long_values_are_trimmed_for_the_message(value, expected_in):
    assert expected_in in linter.shorten(value)


def test_the_real_docs_tree_is_canonical():
    # The tree that ships. If this fails, someone hand-edited a cross-cutting
    # assessment and `apply_canonical.py --apply` is the fix.
    log = Recorder()
    linter.DocsCanonicalValidator(str(project_root / "docs"), log).validate(
        only_platform="gcp")
    assert log.lines == []
