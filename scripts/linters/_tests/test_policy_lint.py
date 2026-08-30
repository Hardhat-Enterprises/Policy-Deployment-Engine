"""Unit tests for scripts/linters/policy_lint.py.

Each case under ``fixtures/`` is a miniature repo tree (``docs/``, ``policies/``,
``inputs/``). The trees are copied into ``tmp_path`` before every test and the
committed ``expected_plan.json`` next to a fixture's ``*.tf`` files is installed
at the sha-named path ``inputs/plan_cache/<platform>/<sha>.json`` that
``auto_test.plan_cache_path`` derives. Installing it at copy time (instead of
committing it under that name) keeps the tests correct when the pinned provider
version changes — the sha is recomputed from the same function the pipeline uses.
"""

import json
import shutil
import sys
from pathlib import Path

import pytest

project_root = Path(__file__).parent.parent.parent.parent
sys.path.insert(0, str(project_root))

from scripts.auto_test import auto_test
from scripts.linters import policy_lint

FIXTURES = Path(__file__).parent / "fixtures"


def build_tree(tmp_path, case):
    """Copy fixture ``case`` into tmp_path and install its plan-cache entries."""
    dst = tmp_path / case
    shutil.copytree(FIXTURES / case, dst)
    for template in sorted(dst.rglob("expected_plan.json")):
        cache = policy_lint.plan_cache_for(dst, template.parent)
        # Guard rail: a bug in the re-rooting would otherwise have these tests
        # writing plan-cache entries into the real repo.
        assert dst in cache.parents, f"{cache} escaped the fixture tree {dst}"
        cache.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(template, cache)
        template.unlink()
    return dst


def pairs(findings):
    """{(policy, rule)} — the assertion surface for most rules."""
    return {(f.policy, f.rule) for f in findings}


# --------------------------------------------------------------------------- #
# Control: a clean resource produces nothing at all.
# --------------------------------------------------------------------------- #
def test_clean_resource_has_no_findings(tmp_path):
    root = build_tree(tmp_path, "clean")
    findings = policy_lint.lint_resource(root, "gcp", "Cloud Storage", "google_storage_bucket")
    assert findings == [], f"clean fixture must be silent, got {findings}"


# --------------------------------------------------------------------------- #
# Policy-body rules.
# --------------------------------------------------------------------------- #
def test_policy_body_rules_fire_exactly_once_each(tmp_path):
    root = build_tree(tmp_path, "policy_smells")
    findings = policy_lint.lint_resource(
        root, "gcp", "Backup for GKE", "google_gke_backup_restore_channel")

    assert pairs(findings) == {
        ("destination_project", "hard-coded-value"),
        ("members", "index-path"),
        ("labels", "presence-only"),
        ("constraint", "wrong-argument"),
        ("brief", "trivial-message"),
        ("short", "trivial-message"),
        ("legacy", "legacy-assign"),
        ("badcase", "package-case"),
    }


def test_trivial_message_flags_short_text_and_empty_remedies_separately(tmp_path):
    root = build_tree(tmp_path, "policy_smells")
    findings = policy_lint.lint_resource(
        root, "gcp", "Backup for GKE", "google_gke_backup_restore_channel")
    by_policy = {f.policy: f.message for f in findings if f.rule == "trivial-message"}
    assert "remedies is empty" in by_policy["brief"]     # long enough, no remedies
    assert "under 20 characters" in by_policy["short"]   # has remedies, too short


def test_location_argument_is_exempt_from_hard_coded_value(tmp_path):
    # location.rego carries "projects/pde-prod/locations/australia-southeast1" —
    # the same literal shape that flags destination_project — and must stay clean.
    root = build_tree(tmp_path, "policy_smells")
    findings = policy_lint.lint_resource(
        root, "gcp", "Backup for GKE", "google_gke_backup_restore_channel")
    assert [f for f in findings if f.policy == "location"] == []


def test_hard_coded_value_message_names_the_literal(tmp_path):
    root = build_tree(tmp_path, "policy_smells")
    findings = policy_lint.lint_resource(
        root, "gcp", "Backup for GKE", "google_gke_backup_restore_channel")
    hard = [f for f in findings if f.rule == "hard-coded-value"]
    assert len(hard) == 1
    assert "projects/PDE" in hard[0].message


def test_only_style_rules_are_warnings(tmp_path):
    root = build_tree(tmp_path, "policy_smells")
    findings = policy_lint.lint_resource(
        root, "gcp", "Backup for GKE", "google_gke_backup_restore_channel")
    warns = {f.rule for f in findings if f.severity == "warn"}
    errors = {f.rule for f in findings if f.severity == "error"}
    assert warns == {"legacy-assign", "package-case"}
    assert "legacy-assign" not in errors and "package-case" not in errors


def test_findings_carry_the_service_and_resource(tmp_path):
    root = build_tree(tmp_path, "policy_smells")
    findings = policy_lint.lint_resource(
        root, "gcp", "Backup for GKE", "google_gke_backup_restore_channel")
    assert {f.service for f in findings} == {"Backup for GKE"}
    assert {f.resource for f in findings} == {"google_gke_backup_restore_channel"}


# --------------------------------------------------------------------------- #
# _vars.rego rules.
# --------------------------------------------------------------------------- #
@pytest.mark.parametrize("resource_type,expected", [
    # a_thing: resource_type doesn't match the directory AND shares a friendly name
    ("google_a_thing", {("_vars", "vars-resource-type"), ("_vars", "vars-friendly-name")}),
    ("google_b_thing", {("_vars", "vars-friendly-name")}),   # duplicate friendly name
    ("google_c_thing", {("_vars", "vars-friendly-name")}),   # empty
    ("google_d_thing", {("_vars", "vars-friendly-name")}),   # equals the raw TF type
    ("google_e_thing", set()),                               # control
])
def test_vars_rules(tmp_path, resource_type, expected):
    root = build_tree(tmp_path, "vars_bad")
    findings = policy_lint.lint_resource(root, "gcp", "Compute Service", resource_type)
    assert pairs(findings) == expected


def test_duplicate_friendly_name_message_names_the_other_resource(tmp_path):
    root = build_tree(tmp_path, "vars_bad")
    findings = policy_lint.lint_resource(root, "gcp", "Compute Service", "google_a_thing")
    dup = [f for f in findings if f.rule == "vars-friendly-name"]
    assert len(dup) == 1
    assert "google_b_thing" in dup[0].message


# --------------------------------------------------------------------------- #
# Fixture rules.
# --------------------------------------------------------------------------- #
def test_fixture_drift_and_missing_plan(tmp_path):
    root = build_tree(tmp_path, "fixtures_bad")
    findings = policy_lint.lint_resource(root, "gcp", "Cloud Storage", "google_storage_bucket")
    assert pairs(findings) == {
        ("public_access_prevention", "fixture-drift"),
        ("uniform_bucket_level_access", "fixture-missing-plan"),
    }
    missing = [f for f in findings if f.rule == "fixture-missing-plan"][0]
    assert "no committed plan cache" in missing.message
    drift = [f for f in findings if f.rule == "fixture-drift"][0]
    # storage_class is the only attribute that differs besides name and the
    # argument under test — it must be the one named.
    assert "storage_class" in drift.message
    assert "public_access_prevention" not in drift.message.split(":", 1)[-1]


@pytest.mark.parametrize("resource_type,noise", [
    # `bucket` is this resource's identity attribute (_vars.resource_value_name),
    # so the two fixtures must differ on it — that is not drift.
    ("google_storage_bucket_iam_binding", "bucket"),
    # effective_labels/terraform_labels are provider-computed mirrors of `labels`
    # and always move with it.
    ("google_storage_bucket", "effective_labels"),
])
def test_fixture_drift_ignores_identity_and_computed_mirrors(tmp_path, resource_type, noise):
    root = build_tree(tmp_path, "fixture_noise")
    findings = policy_lint.lint_resource(root, "gcp", "Cloud Storage", resource_type)
    assert [f for f in findings if f.rule == "fixture-drift"] == [], \
        f"{noise} must not be read as drift"
    # And the plan really does differ on it, so the exemption is doing work.
    plan_dir = root / "inputs" / "gcp" / "Cloud Storage" / resource_type
    cache = policy_lint.plan_cache_for(root, next(plan_dir.iterdir()))
    plan = json.loads(cache.read_text())
    values = {r["name"]: r["values"]
              for r in plan["planned_values"]["root_module"]["resources"]}
    good, bad = values["compliant_example_1"], values["non_compliant_example_1"]
    assert good.get(noise) != bad.get(noise)


def test_plan_cache_for_matches_auto_test_on_the_real_repo():
    # Re-rooting must be a no-op when the tree IS the repo, so the linter reads
    # exactly the cache entries auto_test writes.
    input_dir = (project_root / "inputs" / "gcp" / "Cloud Storage"
                 / "google_storage_bucket" / "public_access_prevention")
    assert input_dir.is_dir(), "real fixture moved — update this test"
    assert (policy_lint.plan_cache_for(project_root, input_dir)
            == auto_test.plan_cache_path(input_dir))


# --------------------------------------------------------------------------- #
# load_conditions
# --------------------------------------------------------------------------- #
def test_load_conditions_returns_the_declared_conditions(tmp_path):
    root = build_tree(tmp_path, "clean")
    rego = (root / "policies" / "gcp" / "Cloud Storage" / "google_storage_bucket"
            / "public_access_prevention.rego")
    conditions = policy_lint.load_conditions(rego, root / "policies", policy_lint.HELPERS_DIR)
    assert len(conditions) == 1
    meta, check = conditions[0]
    assert meta["remedies"] == ["Set public_access_prevention to 'enforced'"]
    assert check["attribute_path"] == ["public_access_prevention"]
    assert check["policy_type"] == "whitelist"


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #
def test_cli_json_output_and_exit_code(tmp_path, capsys):
    root = build_tree(tmp_path, "policy_smells")
    rc = policy_lint.main([
        "--root", str(root), "--json",
        "gcp/Backup for GKE/google_gke_backup_restore_channel",
    ])
    assert rc == 1
    data = json.loads(capsys.readouterr().out)
    assert isinstance(data, list)
    for entry in data:
        assert {"service", "resource", "policy", "rule", "message", "severity"} == set(entry)
    assert {(e["policy"], e["rule"]) for e in data} == {
        ("destination_project", "hard-coded-value"),
        ("members", "index-path"),
        ("labels", "presence-only"),
        ("constraint", "wrong-argument"),
        ("brief", "trivial-message"),
        ("short", "trivial-message"),
        ("legacy", "legacy-assign"),
        ("badcase", "package-case"),
    }


def test_cli_exits_zero_on_a_clean_resource(tmp_path, capsys):
    root = build_tree(tmp_path, "clean")
    rc = policy_lint.main([
        "--root", str(root), "gcp/Cloud Storage/google_storage_bucket"])
    capsys.readouterr()
    assert rc == 0


def test_cli_exits_zero_when_only_warnings_are_found(tmp_path, capsys):
    # A tree whose only findings are warn-severity must not fail the build.
    root = build_tree(tmp_path, "policy_smells")
    for name in ("destination_project", "members", "labels", "constraint", "brief", "short"):
        (root / "policies" / "gcp" / "Backup for GKE"
         / "google_gke_backup_restore_channel" / f"{name}.rego").unlink()
    rc = policy_lint.main([
        "--root", str(root), "--json",
        "gcp/Backup for GKE/google_gke_backup_restore_channel"])
    data = json.loads(capsys.readouterr().out)
    assert {e["severity"] for e in data} == {"warn"}
    assert rc == 0


def test_cli_list_rules_prints_every_id(capsys):
    rc = policy_lint.main(["--list-rules"])
    out = capsys.readouterr().out
    assert rc == 0
    for rule_id, description in policy_lint.RULES.items():
        assert rule_id in out
        assert description.split(".")[0][:30] in out


def test_cli_accepts_a_service_scoped_target(tmp_path, capsys):
    # "<platform>/<Service folder>" lints every resource type in the folder.
    root = build_tree(tmp_path, "vars_bad")
    rc = policy_lint.main(["--root", str(root), "--json", "gcp/Compute Service"])
    data = json.loads(capsys.readouterr().out)
    assert rc == 1
    assert {e["resource"] for e in data} == {
        "google_a_thing", "google_b_thing", "google_c_thing", "google_d_thing"}
