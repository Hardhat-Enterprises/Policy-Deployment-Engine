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
import subprocess
import sys
from pathlib import Path

import pytest

project_root = Path(__file__).parent.parent.parent.parent
sys.path.insert(0, str(project_root))

from scripts.auto_test import auto_test
from scripts.linters import policy_lint

FIXTURES = Path(__file__).parent / "fixtures"


@pytest.fixture(autouse=True)
def _clean_caches():
    """The OPA-evaluation caches are process-global; no test may inherit one."""
    policy_lint.clear_caches()
    yield
    policy_lint.clear_caches()


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


def test_only_advisory_rules_are_warnings(tmp_path):
    # The two style conventions plus presence-only, which is a judgement about
    # the argument's rationale that the reviewer makes, not the linter.
    root = build_tree(tmp_path, "policy_smells")
    findings = policy_lint.lint_resource(
        root, "gcp", "Backup for GKE", "google_gke_backup_restore_channel")
    warns = {f.rule for f in findings if f.severity == "warn"}
    errors = {f.rule for f in findings if f.severity == "error"}
    assert warns == {"legacy-assign", "package-case", "presence-only"}
    assert not (warns & errors), "a rule must have one severity, not both"


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
    for name in ("destination_project", "members", "constraint", "brief", "short"):
        (root / "policies" / "gcp" / "Backup for GKE"
         / "google_gke_backup_restore_channel" / f"{name}.rego").unlink()
    rc = policy_lint.main([
        "--root", str(root), "--json",
        "gcp/Backup for GKE/google_gke_backup_restore_channel"])
    data = json.loads(capsys.readouterr().out)
    assert {e["severity"] for e in data} == {"warn"}
    assert {e["rule"] for e in data} == {"legacy-assign", "package-case", "presence-only"}
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


# --------------------------------------------------------------------------- #
# Fix round 1: attribute_path given as a string.
# --------------------------------------------------------------------------- #
@pytest.mark.parametrize("policy", ["disabled", "keys.key_algorithm"])
def test_string_attribute_path_is_split_not_iterated(tmp_path, policy):
    # `"attribute_path": "disabled"` is a form shared.rego supports. Iterating it
    # character by character made every such policy a false wrong-argument.
    root = build_tree(tmp_path, "string_path")
    findings = policy_lint.lint_resource(root, "gcp", "Cloud Platform", "google_service_account")
    assert [f for f in findings if f.policy == policy] == []


def test_string_attribute_path_still_reaches_the_value_rules(tmp_path):
    # Normalising must not make the checks blind: a hard-coded literal behind a
    # string path is still found.
    root = build_tree(tmp_path, "string_path")
    rego = (root / "policies" / "gcp" / "Cloud Platform" / "google_service_account"
            / "disabled.rego")
    rego.write_text(rego.read_text().replace(
        '"attribute_path": "disabled",\n     "values": [true],',
        '"attribute_path": "disabled",\n     "values": ["projects/PDE"],'))
    findings = policy_lint.lint_resource(root, "gcp", "Cloud Platform", "google_service_account")
    assert ("disabled", "hard-coded-value") in pairs(findings)


# --------------------------------------------------------------------------- #
# Fix round 1: a broken kit must degrade, never abort the run.
# --------------------------------------------------------------------------- #
def test_broken_policy_reports_lint_error_and_lets_siblings_through(tmp_path):
    root = build_tree(tmp_path, "broken")
    findings = policy_lint.lint_resource(root, "gcp", "Cloud Platform", "google_broken_thing")
    assert pairs(findings) == {
        ("broken", "lint-error"),           # unparseable
        ("noconditions", "lint-error"),     # declares no `conditions` at all
        # A file whose conditions cannot be read is still checked for everything
        # that does not depend on them...
        ("noconditions", "fixture-missing-plan"),
        ("good", "fixture-missing-plan"),   # ...and the healthy sibling is still linted
    }


def test_lint_error_message_carries_the_opa_reason(tmp_path):
    # `opa eval` writes parse errors to stdout, not stderr — the reason must
    # still reach the finding.
    root = build_tree(tmp_path, "broken")
    findings = policy_lint.lint_resource(root, "gcp", "Cloud Platform", "google_broken_thing")
    broken = [f for f in findings if f.policy == "broken"][0]
    assert broken.severity == "error"
    assert "rego_parse_error" in broken.message or "unexpected eof" in broken.message


def test_missing_vars_file_is_not_a_crash(tmp_path):
    # The broken kit has no _vars.rego at all.
    root = build_tree(tmp_path, "broken")
    findings = policy_lint.lint_resource(root, "gcp", "Cloud Platform", "google_broken_thing")
    assert [f for f in findings if f.rule.startswith("vars-")] == []


def test_lint_error_is_a_documented_rule():
    assert "lint-error" in policy_lint.RULES


# --------------------------------------------------------------------------- #
# Fix round 1: the friendly-name index is one OPA call, not one per resource.
# --------------------------------------------------------------------------- #
def test_friendly_name_index_uses_a_single_opa_call(tmp_path, monkeypatch):
    root = build_tree(tmp_path, "vars_bad")
    policy_lint.clear_caches()

    real_run = subprocess.run
    calls = []

    def counting_run(cmd, *args, **kwargs):
        calls.append(cmd)
        return real_run(cmd, *args, **kwargs)

    monkeypatch.setattr(policy_lint.subprocess, "run", counting_run)
    index = policy_lint._friendly_name_index(root / "policies", "gcp")

    assert len(calls) == 1, f"expected one batched opa eval, got {len(calls)}"
    assert sorted(rt for names in index.values() for _, rt in names) == [
        "google_a_thing", "google_b_thing", "google_d_thing", "google_e_thing"]


# --------------------------------------------------------------------------- #
# Fix round 1: usage errors exit 2, distinct from findings (1).
# --------------------------------------------------------------------------- #
@pytest.mark.parametrize("target,needle", [
    ("aws/Cloud Storage/google_storage_bucket", "aws"),          # no such platform tree
    ("gcp/Nonexistent Service/google_storage_bucket", "Nonexistent Service"),
    ("gcp/Cloud Storage/google_nonexistent_thing", "google_nonexistent_thing"),
    ("gcp/a/b/c", "a/b/c"),                                       # malformed
])
def test_unknown_target_is_a_usage_error(tmp_path, capsys, target, needle):
    root = build_tree(tmp_path, "clean")
    rc = policy_lint.main(["--root", str(root), target])
    err = capsys.readouterr().err
    assert rc == 2, "a mistyped target must be a usage error, not 0 findings or 1"
    assert needle in err


def test_findings_still_exit_one(tmp_path, capsys):
    root = build_tree(tmp_path, "policy_smells")
    rc = policy_lint.main([
        "--root", str(root), "gcp/Backup for GKE/google_gke_backup_restore_channel"])
    capsys.readouterr()
    assert rc == 1


# --------------------------------------------------------------------------- #
# Fix round 1: the identity-attribute exemption is only for label-shaped values.
# --------------------------------------------------------------------------- #
def test_identity_exemption_only_covers_the_fixture_labels(tmp_path):
    # `bucket` is this resource's resource_value_name, but here the two fixtures
    # name two genuinely different buckets — that is real drift, not identity.
    root = build_tree(tmp_path, "fixture_identity_drift")
    findings = policy_lint.lint_resource(
        root, "gcp", "Cloud Storage", "google_storage_bucket_iam_binding")
    drift = [f for f in findings if f.rule == "fixture-drift"]
    assert len(drift) == 1
    assert "bucket" in drift[0].message


# --------------------------------------------------------------------------- #
# Fix wave 2: a broken file must not make the vars index fan out.
# --------------------------------------------------------------------------- #
def _break_one_policy(root):
    """Drop an unparseable .rego into a tree, so the batched eval fails."""
    broken = (root / "policies" / "gcp" / "Compute Service" / "google_a_thing"
              / "oops.rego")
    broken.write_text("package terraform.gcp.security.compute_service."
                      "google_a_thing.oops\n\nconditions := [[[[\n")
    return broken


def test_friendly_index_does_not_fan_out_when_the_batch_fails(tmp_path, monkeypatch):
    # The batched eval fails because of the broken file. Falling back to one opa
    # call per _vars.rego cost 370 subprocesses (~9s); the text of the file is
    # enough to read a friendly name, so no fan-out is needed.
    root = build_tree(tmp_path, "vars_bad")
    _break_one_policy(root)
    policy_lint.clear_caches()

    real_run = subprocess.run
    calls = []

    def counting_run(cmd, *args, **kwargs):
        calls.append(cmd)
        return real_run(cmd, *args, **kwargs)

    monkeypatch.setattr(policy_lint.subprocess, "run", counting_run)
    index = policy_lint._friendly_name_index(root / "policies", "gcp")

    assert len(calls) <= 2, f"the index fanned out: {len(calls)} opa calls"
    # ...and it is still complete: the duplicate pair is still detected.
    assert sorted(rt for _, rt in index["shared fixture name"]) == [
        "google_a_thing", "google_b_thing"]


def test_duplicate_friendly_names_still_found_with_a_broken_file(tmp_path):
    root = build_tree(tmp_path, "vars_bad")
    _break_one_policy(root)
    findings = policy_lint.lint_resource(root, "gcp", "Compute Service", "google_b_thing")
    assert ("_vars", "vars-friendly-name") in pairs(findings)


# --------------------------------------------------------------------------- #
# Fix wave 2: presence-only is a warning — the reviewer rules on the rationale.
# --------------------------------------------------------------------------- #
def test_presence_only_is_a_warning(tmp_path):
    root = build_tree(tmp_path, "policy_smells")
    findings = policy_lint.lint_resource(
        root, "gcp", "Backup for GKE", "google_gke_backup_restore_channel")
    presence = [f for f in findings if f.rule == "presence-only"]
    assert len(presence) == 1
    assert presence[0].severity == "warn"
    assert "presence-only" in policy_lint.WARN_RULES


# --------------------------------------------------------------------------- #
# Fix wave 2: a malformed plan cache is a finding, not an AttributeError.
# --------------------------------------------------------------------------- #
@pytest.mark.parametrize("payload", ['[]', '"nope"', '{"planned_values": []}',
                                     '{"planned_values": {"root_module": "x"}}'])
def test_malformed_plan_cache_is_a_lint_error(tmp_path, payload):
    root = build_tree(tmp_path, "clean")
    input_dir = (root / "inputs" / "gcp" / "Cloud Storage" / "google_storage_bucket"
                 / "public_access_prevention")
    policy_lint.plan_cache_for(root, input_dir).write_text(payload)
    findings = policy_lint.lint_resource(root, "gcp", "Cloud Storage", "google_storage_bucket")
    assert pairs(findings) == {("public_access_prevention", "lint-error")}


# --------------------------------------------------------------------------- #
# Fix wave 2: no `opa` on PATH is one environment error, not N findings.
# --------------------------------------------------------------------------- #
def test_missing_opa_binary_propagates_once(tmp_path, monkeypatch):
    root = build_tree(tmp_path, "policy_smells")
    policy_lint.clear_caches()

    def no_opa(cmd, *args, **kwargs):
        raise FileNotFoundError(2, "No such file or directory", "opa")

    monkeypatch.setattr(policy_lint.subprocess, "run", no_opa)
    with pytest.raises(policy_lint.PolicyLintError) as excinfo:
        policy_lint.lint_resource(
            root, "gcp", "Backup for GKE", "google_gke_backup_restore_channel")
    assert "opa" in str(excinfo.value)
    # run_precommit_linter.py catches PolicyLintError for exactly this case.
    assert isinstance(excinfo.value, policy_lint.PolicyLintError)


def test_missing_opa_binary_is_one_cli_error(tmp_path, monkeypatch, capsys):
    root = build_tree(tmp_path, "policy_smells")
    policy_lint.clear_caches()
    monkeypatch.setattr(policy_lint.subprocess, "run",
                        lambda *a, **k: (_ for _ in ()).throw(FileNotFoundError()))
    rc = policy_lint.main([
        "--root", str(root), "gcp/Backup for GKE/google_gke_backup_restore_channel"])
    err = capsys.readouterr().err
    assert rc == 2
    assert err.count("[ERROR]") == 1, f"expected a single environment error, got:\n{err}"


# --------------------------------------------------------------------------- #
# Fix wave 2: unpaired fixture resources are reported, not skipped.
# --------------------------------------------------------------------------- #
def test_unpaired_fixture_resource_is_reported(tmp_path):
    root = build_tree(tmp_path, "clean")
    input_dir = (root / "inputs" / "gcp" / "Cloud Storage" / "google_storage_bucket"
                 / "public_access_prevention")
    cache = policy_lint.plan_cache_for(root, input_dir)
    plan = json.loads(cache.read_text())
    resources = plan["planned_values"]["root_module"]["resources"]
    # A second non-compliant example with no compliant counterpart.
    orphan = json.loads(json.dumps(
        [r for r in resources if r["name"] == "non_compliant_example_1"][0]))
    orphan["name"] = "non_compliant_example_2"
    orphan["values"]["name"] = "non_compliant_example_2"
    resources.append(orphan)
    cache.write_text(json.dumps(plan))

    findings = policy_lint.lint_resource(root, "gcp", "Cloud Storage", "google_storage_bucket")
    assert pairs(findings) == {("public_access_prevention", "fixture-unpaired")}
    assert "non_compliant_example_2" in findings[0].message
    assert "fixture-unpaired" in policy_lint.RULES


# --------------------------------------------------------------------------- #
# Fix wave 2: a resource type with no policies directory is machine-readable.
# --------------------------------------------------------------------------- #
def test_missing_policies_dir_prints_a_marker(tmp_path, capsys):
    root = build_tree(tmp_path, "clean")
    target = "gcp/Cloud Storage/google_storage_bucket_iam_binding"
    rc = policy_lint.main(["--root", str(root), target])
    err = capsys.readouterr().err
    assert rc == 2
    assert f"[ERROR] no-policies-dir: {target}" in err


def test_mistyped_service_is_not_a_no_policies_dir_marker(tmp_path, capsys):
    root = build_tree(tmp_path, "clean")
    rc = policy_lint.main(["--root", str(root), "gcp/Clod Storage/google_storage_bucket"])
    err = capsys.readouterr().err
    assert rc == 2
    assert "no-policies-dir" not in err
