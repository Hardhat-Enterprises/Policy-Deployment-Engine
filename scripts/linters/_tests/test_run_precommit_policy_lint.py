"""Unit tests for the policy_lint wiring in run_precommit_linter.py.

These exercise the owned-triple derivation, the "fail only on findings the
contributor's own changes reached" filter, and the base-tree comparison that
narrows that further to the findings the change actually *introduced* — with a
fake ``policy_lint.lint_resource`` (monkeypatched), so no OPA and no real policy
tree is required.

The base-tree tests that shell out to git build a throwaway one-commit repo in
``tmp_path`` (the ``git_repo`` fixture) rather than touching this checkout.
"""

import re
import subprocess
import sys
from pathlib import Path

import pytest

project_root = Path(__file__).parent.parent.parent.parent
sys.path.insert(0, str(project_root))

from scripts.linters import policy_lint
from scripts.linters import run_precommit_linter as rpl

Finding = policy_lint.Finding


# --------------------------------------------------------------------------- #
# _owned_triples
# --------------------------------------------------------------------------- #
def test_owned_triples_from_a_policy_file():
    changed = {"policies/gcp/BigQuery/google_bigquery_dataset/dataset_id.rego"}
    assert rpl._owned_triples(changed) == {("gcp", "BigQuery", "google_bigquery_dataset")}


def test_owned_triples_from_an_input_fixture_file():
    changed = {"inputs/gcp/BigQuery/google_bigquery_dataset/dataset_id/compliant.tf"}
    assert rpl._owned_triples(changed) == {("gcp", "BigQuery", "google_bigquery_dataset")}


def test_owned_triples_dedupes_across_multiple_files_in_the_same_resource():
    changed = {
        "policies/gcp/BigQuery/google_bigquery_dataset/dataset_id.rego",
        "policies/gcp/BigQuery/google_bigquery_dataset/_vars.rego",
        "inputs/gcp/BigQuery/google_bigquery_dataset/dataset_id/compliant.tf",
    }
    assert rpl._owned_triples(changed) == {("gcp", "BigQuery", "google_bigquery_dataset")}


def test_owned_triples_ignores_docs_and_shallow_paths():
    changed = {
        "docs/gcp/BigQuery/google_bigquery_dataset.json",
        "policies/gcp",             # too shallow: no resource type segment
        "README.md",
    }
    assert rpl._owned_triples(changed) == set()


def test_owned_triples_spans_multiple_resource_types():
    changed = {
        "policies/gcp/BigQuery/google_bigquery_dataset/dataset_id.rego",
        "policies/gcp/Cloud Storage/google_storage_bucket/location.rego",
    }
    assert rpl._owned_triples(changed) == {
        ("gcp", "BigQuery", "google_bigquery_dataset"),
        ("gcp", "Cloud Storage", "google_storage_bucket"),
    }


# --------------------------------------------------------------------------- #
# _finding_path / _finding_owned
# --------------------------------------------------------------------------- #
def test_finding_path_for_a_policy_finding():
    finding = Finding("BigQuery", "google_bigquery_dataset", "dataset_id",
                       "hard-coded-value", "msg")
    path = rpl._finding_path("gcp", "BigQuery", "google_bigquery_dataset", finding)
    assert path == "policies/gcp/BigQuery/google_bigquery_dataset/dataset_id.rego"


def test_finding_path_for_a_vars_finding():
    finding = Finding("BigQuery", "google_bigquery_dataset", "_vars",
                       "vars-resource-type", "msg")
    path = rpl._finding_path("gcp", "BigQuery", "google_bigquery_dataset", finding)
    assert path == "policies/gcp/BigQuery/google_bigquery_dataset/_vars.rego"


def test_finding_path_for_a_fixture_finding_is_the_argument_directory():
    finding = Finding("BigQuery", "google_bigquery_dataset", "dataset_id",
                       "fixture-drift", "msg")
    path = rpl._finding_path("gcp", "BigQuery", "google_bigquery_dataset", finding)
    assert path == "inputs/gcp/BigQuery/google_bigquery_dataset/dataset_id"


def test_finding_owned_when_the_exact_policy_file_changed():
    path = "policies/gcp/BigQuery/google_bigquery_dataset/dataset_id.rego"
    assert rpl._finding_owned(path, {path})


def test_finding_owned_when_a_file_under_the_fixture_directory_changed():
    directory = "inputs/gcp/BigQuery/google_bigquery_dataset/dataset_id"
    changed = {f"{directory}/compliant.tf"}
    assert rpl._finding_owned(directory, changed)


def test_finding_not_owned_for_a_sibling_argument():
    # The contributor touched dataset_id.rego; a pre-existing error on a
    # different argument in the same resource type must not be attributed to
    # them.
    changed = {"policies/gcp/BigQuery/google_bigquery_dataset/dataset_id.rego"}
    other = "policies/gcp/BigQuery/google_bigquery_dataset/max_time_travel_hours.rego"
    assert not rpl._finding_owned(other, changed)


# --------------------------------------------------------------------------- #
# _policy_lint_findings — fake lint_resource, no OPA/git required
# --------------------------------------------------------------------------- #
def test_policy_lint_findings_keeps_only_owned_errors(monkeypatch):
    findings_by_triple = {
        ("gcp", "BigQuery", "google_bigquery_dataset"): [
            Finding("BigQuery", "google_bigquery_dataset", "dataset_id",
                    "hard-coded-value", "owned error"),
            Finding("BigQuery", "google_bigquery_dataset", "other_arg",
                    "hard-coded-value", "sibling, not owned"),
            Finding("BigQuery", "google_bigquery_dataset", "dataset_id",
                    "legacy-assign", "owned warning", severity="warn"),
        ],
    }

    def fake_lint_resource(root, platform, service, resource_type):
        return findings_by_triple[(platform, service, resource_type)]

    monkeypatch.setattr(policy_lint, "lint_resource", fake_lint_resource)

    changed = {"policies/gcp/BigQuery/google_bigquery_dataset/dataset_id.rego"}
    triples = rpl._owned_triples(changed)

    owned, backlog = rpl._policy_lint_findings(triples, changed, root="/repo")

    assert [f.rule for _, f in owned] == ["hard-coded-value"]
    assert owned[0][0] == "policies/gcp/BigQuery/google_bigquery_dataset/dataset_id.rego"
    # The sibling-argument error is backlog; the warning is never counted at all.
    assert backlog == 1


def test_policy_lint_findings_covers_multiple_owned_triples(monkeypatch):
    findings_by_triple = {
        ("gcp", "BigQuery", "google_bigquery_dataset"): [
            Finding("BigQuery", "google_bigquery_dataset", "dataset_id",
                    "hard-coded-value", "e1"),
        ],
        ("gcp", "Cloud Storage", "google_storage_bucket"): [
            Finding("Cloud Storage", "google_storage_bucket", "location",
                    "hard-coded-value", "e2"),
        ],
    }

    def fake_lint_resource(root, platform, service, resource_type):
        return findings_by_triple[(platform, service, resource_type)]

    monkeypatch.setattr(policy_lint, "lint_resource", fake_lint_resource)

    changed = {
        "policies/gcp/BigQuery/google_bigquery_dataset/dataset_id.rego",
        "policies/gcp/Cloud Storage/google_storage_bucket/location.rego",
    }
    triples = rpl._owned_triples(changed)

    owned, backlog = rpl._policy_lint_findings(triples, changed, root="/repo")

    assert {f.message for _, f in owned} == {"e1", "e2"}
    assert backlog == 0


def test_policy_lint_findings_owns_a_fixture_finding_via_the_argument_directory(monkeypatch):
    findings_by_triple = {
        ("gcp", "BigQuery", "google_bigquery_dataset"): [
            Finding("BigQuery", "google_bigquery_dataset", "dataset_id",
                    "fixture-drift", "compliant.tf and nonCompliant.tf also differ on: x"),
        ],
    }

    def fake_lint_resource(root, platform, service, resource_type):
        return findings_by_triple[(platform, service, resource_type)]

    monkeypatch.setattr(policy_lint, "lint_resource", fake_lint_resource)

    changed = {"inputs/gcp/BigQuery/google_bigquery_dataset/dataset_id/compliant.tf"}
    triples = rpl._owned_triples(changed)

    owned, backlog = rpl._policy_lint_findings(triples, changed, root="/repo")

    assert len(owned) == 1
    assert owned[0][0] == "inputs/gcp/BigQuery/google_bigquery_dataset/dataset_id"
    assert backlog == 0


# --------------------------------------------------------------------------- #
# The rules page carries every rule id
# --------------------------------------------------------------------------- #
def test_every_rule_has_an_anchored_heading_in_the_rules_page():
    page = (project_root / "Guide" / "Policy_writing_tutorial" / "policy-lint.md").read_text(
        encoding="utf-8")
    headings = set(re.findall(r"^##\s+([a-z0-9-]+)\s*$", page, re.MULTILINE))
    missing = set(policy_lint.RULES) - headings
    assert not missing, f"policy-lint.md is missing headings for: {sorted(missing)}"


# --------------------------------------------------------------------------- #
# _finding_key / _finding_counts — a finding's identity excludes its message
# --------------------------------------------------------------------------- #
def test_finding_key_excludes_the_message():
    # Same finding, message re-worded by an unrelated edit (a line number moved).
    a = Finding("BigQuery", "google_bigquery_dataset", "dataset_id",
                "hard-coded-value", "project id 'projects/PDE' at line 12")
    b = Finding("BigQuery", "google_bigquery_dataset", "dataset_id",
                "hard-coded-value", "project id 'projects/PDE' at line 40")
    assert rpl._finding_key(a) == rpl._finding_key(b)


def test_finding_counts_ignores_warnings():
    findings = [
        Finding("BigQuery", "google_bigquery_dataset", "dataset_id",
                "hard-coded-value", "err"),
        Finding("BigQuery", "google_bigquery_dataset", "dataset_id",
                "legacy-assign", "warn", severity="warn"),
    ]
    counts = rpl._finding_counts(findings)
    assert sum(counts.values()) == 1
    assert list(counts)[0][0][0] == "hard-coded-value"


# --------------------------------------------------------------------------- #
# _split_new_and_inherited — new vs inherited
# --------------------------------------------------------------------------- #
DATASET_REGO = "policies/gcp/BigQuery/google_bigquery_dataset/dataset_id.rego"


def _owned(*findings):
    """HEAD's owned (path, Finding) pairs for the dataset_id policy file."""
    return [(DATASET_REGO, finding) for finding in findings]


def _hard_coded(message="literal project id 'projects/PDE'"):
    return Finding("BigQuery", "google_bigquery_dataset", "dataset_id",
                   "hard-coded-value", message)


def test_a_finding_present_in_both_base_and_head_is_inherited_not_new():
    baseline = rpl._finding_counts([_hard_coded()])
    new, inherited = rpl._split_new_and_inherited(_owned(_hard_coded()), baseline)
    assert new == []
    assert [f.rule for _, f in inherited] == ["hard-coded-value"]


def test_a_finding_whose_message_shifted_is_still_inherited():
    # The point of keying on (rule, service, resource, policy): a legitimate edit
    # moves line numbers and counts inside the message, and that must not read as
    # a new problem.
    baseline = rpl._finding_counts([_hard_coded("2 conditions name 'projects/PDE'")])
    new, inherited = rpl._split_new_and_inherited(
        _owned(_hard_coded("3 conditions name 'projects/PDE'")), baseline)
    assert new == []
    assert len(inherited) == 1


def test_a_genuinely_new_finding_fails():
    baseline = rpl._finding_counts([_hard_coded()])
    introduced = Finding("BigQuery", "google_bigquery_dataset", "dataset_id",
                         "index-path", "attribute_path ends in [0]")
    new, inherited = rpl._split_new_and_inherited(
        _owned(_hard_coded(), introduced), baseline)
    assert [f.rule for _, f in new] == ["index-path"]
    assert [f.rule for _, f in inherited] == ["hard-coded-value"]


def test_a_new_finding_in_a_resource_type_absent_from_the_base_is_new():
    # A brand-new resource type lints to nothing on the base tree, so every
    # finding in it belongs to the contributor who added it.
    new, inherited = rpl._split_new_and_inherited(_owned(_hard_coded()),
                                                  rpl._finding_counts([]))
    assert len(new) == 1
    assert inherited == []


def test_removing_a_finding_passes():
    baseline = rpl._finding_counts([_hard_coded("a"), _hard_coded("b")])
    new, inherited = rpl._split_new_and_inherited(_owned(_hard_coded("a")), baseline)
    assert new == []
    assert len(inherited) == 1


def test_removing_every_finding_passes():
    baseline = rpl._finding_counts([_hard_coded()])
    new, inherited = rpl._split_new_and_inherited([], baseline)
    assert (new, inherited) == ([], [])


def test_going_from_one_to_two_of_the_same_rule_in_the_same_file_fails():
    # Counts, not set membership: the file already had one hard-coded value and
    # the change added a second, so exactly one finding is the contributor's.
    baseline = rpl._finding_counts([_hard_coded("literal 'projects/PDE'")])
    new, inherited = rpl._split_new_and_inherited(
        _owned(_hard_coded("literal 'projects/PDE'"),
               _hard_coded("literal 'projects/OTHER'")), baseline)
    assert [f.message for _, f in new] == ["literal 'projects/OTHER'"]
    assert [f.message for _, f in inherited] == ["literal 'projects/PDE'"]


def test_two_findings_of_one_rule_unchanged_are_both_inherited():
    baseline = rpl._finding_counts([_hard_coded("a"), _hard_coded("b")])
    new, inherited = rpl._split_new_and_inherited(
        _owned(_hard_coded("a"), _hard_coded("b")), baseline)
    assert new == []
    assert len(inherited) == 2


# --------------------------------------------------------------------------- #
# _base_commit / _base_tree / _subtract_baseline — real git, fake lint_resource
# --------------------------------------------------------------------------- #
@pytest.fixture
def git_repo(tmp_path, monkeypatch):
    """A throwaway one-commit repo, cwd'd into: the helpers shell out to git."""
    repo = tmp_path / "repo"
    repo.mkdir()

    def git(*args):
        subprocess.run(["git", "-C", str(repo), *args], check=True, capture_output=True)

    git("init", "--quiet", "-b", "main")
    git("config", "user.email", "linter@example.invalid")
    git("config", "user.name", "Linter Test")
    git("config", "commit.gpgsign", "false")
    (repo / "README.md").write_text("base\n", encoding="utf-8")
    git("add", "README.md")
    git("commit", "--quiet", "-m", "base commit")
    monkeypatch.chdir(repo)
    return repo


def test_missing_base_ref_fails_loudly_instead_of_blaming_everything(git_repo):
    # A shallow CI clone: the base branch is simply not here. Treating that as
    # "an empty base tree" would blame the contributor for the whole backlog of
    # every file they touched, so it must be a hard, explained failure.
    with pytest.raises(rpl.BaseTreeUnavailable) as excinfo:
        rpl._base_commit("origin/dev")
    message = str(excinfo.value)
    assert "origin/dev" in message
    assert "fetch-depth: 0" in message


def test_main_refuses_to_run_at_all_without_a_reachable_base_ref(git_repo, capsys):
    # Not just "everything is new": with no base ref, changed_files() diffs
    # against a ref git cannot resolve, comes back empty, and the gate would
    # otherwise pass every PR silently. It must fail instead.
    assert rpl.main(["--base", "origin/dev"]) == 1
    out = capsys.readouterr().out
    assert "[FAIL]" in out
    assert "fetch-depth: 0" in out
    assert "skipping linter" not in out


def test_subtract_baseline_propagates_a_missing_base_ref(git_repo):
    with pytest.raises(rpl.BaseTreeUnavailable):
        rpl._subtract_baseline(_owned(_hard_coded()), base="origin/dev")


def test_base_commit_without_a_base_is_head(git_repo):
    head = subprocess.run(["git", "rev-parse", "HEAD"],
                          capture_output=True, text=True).stdout.strip()
    assert rpl._base_commit() == head


def test_subtract_baseline_lints_a_real_base_worktree_and_removes_it(git_repo, monkeypatch):
    seen_roots = []

    def fake_lint_resource(root, platform, service, resource_type):
        seen_roots.append(Path(root))
        return [_hard_coded("literal 'projects/PDE' (base wording)")]

    monkeypatch.setattr(policy_lint, "lint_resource", fake_lint_resource)

    new, inherited = rpl._subtract_baseline(
        _owned(_hard_coded("literal 'projects/PDE' (head wording)")))

    assert new == []
    assert len(inherited) == 1
    # The base tree is a separate checkout, not the tree we are standing in ...
    assert seen_roots and seen_roots[0].resolve() != git_repo.resolve()
    # ... and it is gone again, both on disk and as a registered worktree.
    assert not seen_roots[0].exists()
    listed = subprocess.run(["git", "worktree", "list", "--porcelain"],
                            capture_output=True, text=True).stdout
    assert "policy-lint-base-" not in listed


def test_base_tree_is_removed_even_when_linting_it_raises(git_repo, monkeypatch):
    seen_roots = []

    def exploding_lint_resource(root, platform, service, resource_type):
        seen_roots.append(Path(root))
        raise policy_lint.PolicyLintError("opa fell over")

    monkeypatch.setattr(policy_lint, "lint_resource", exploding_lint_resource)

    with pytest.raises(policy_lint.PolicyLintError):
        rpl._subtract_baseline(_owned(_hard_coded()))

    assert seen_roots and not seen_roots[0].exists()


def test_no_owned_findings_means_the_base_tree_is_never_built(monkeypatch):
    # Cost control: a target that is clean at HEAD has nothing to subtract, so
    # checking out and linting the base tree for it is pure waste.
    def refuse(*args, **kwargs):
        raise AssertionError("the base tree must not be built when nothing is owned")

    monkeypatch.setattr(rpl, "_base_tree", refuse)
    monkeypatch.setattr(rpl, "_base_commit", refuse)

    assert rpl._subtract_baseline([]) == ([], [])


def test_only_targets_with_a_finding_at_head_are_linted_on_the_base(git_repo, monkeypatch):
    linted = []

    def fake_lint_resource(root, platform, service, resource_type):
        linted.append((platform, service, resource_type))
        return []

    monkeypatch.setattr(policy_lint, "lint_resource", fake_lint_resource)

    # The base targets come from the owned findings, not from the changed set:
    # a resource type the change touched but left clean never reaches the base
    # tree at all, because there would be nothing to subtract from.
    rpl._subtract_baseline(_owned(_hard_coded()))

    assert linted == [("gcp", "BigQuery", "google_bigquery_dataset")]


# --------------------------------------------------------------------------- #
# _print_inherited — context, never a failure
# --------------------------------------------------------------------------- #
def test_print_inherited_says_nothing_when_there_is_nothing_inherited(capsys):
    rpl._print_inherited([])
    assert capsys.readouterr().out == ""


def test_print_inherited_summarises_by_rule_and_elides_a_long_list(capsys):
    inherited = [(f"policies/gcp/BigQuery/google_bigquery_dataset/arg_{i}.rego",
                  _hard_coded(f"m{i}")) for i in range(rpl.INHERITED_PREVIEW + 5)]
    rpl._print_inherited(inherited)
    out = capsys.readouterr().out
    assert f"hard-coded-value x{len(inherited)}" in out
    assert "not attributed to you" in out
    assert "... and 5 more" in out
