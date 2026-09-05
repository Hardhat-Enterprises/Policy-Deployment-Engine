#!/usr/bin/env python3
"""Everything CI will check about your resource, in one command.

Run it with no arguments on your ``Service/<platform>/<service_slug>/<resource_type>``
branch::

    python3 scripts/check_resource.py

It runs the same checks the pull-request workflows run, in the same order, and
tells you which one failed:

  1. Branch name           scripts/linters/check_branch_name.py
  2. Branch scope          scripts/linters/branch_scope.py
  3. Lint (changed files)  scripts/linters/run_precommit_linter.py
                           -> structure + policy content, failing only on what
                              this branch changed or introduced
  4. Doc completeness      every leaf argument in docs/<platform>/<folder>/<resource>.json
                           has a REAL boolean ``security_impact`` (the "true/false"
                           placeholder the linter tolerates tree-wide is rejected
                           here) and a non-empty ``rationale``
  5. True-arg coverage     every argument with ``security_impact: true`` has both a
                           policy ``policies/.../<resource>/<arg>.rego`` and a fixture
                           ``inputs/.../<resource>/<arg>/``
  6. OPA test              scripts/auto_test/auto_test.py scoped to the resource
                           (terraform plan + opa eval), which also enforces
                           input<->policy pairing

Steps 4-6 are the *resource gate*: they are the checks that only make sense for one
resource, and they are what CI's ``policy_check`` job runs (with ``--gate-only``,
because its ``lint`` job has already run 1-3 for every branch, Service or not).

Non-``Service/`` branches skip the resource gate and exit 0 — there is no single
resource to check.

Options
-------
``--branch <ref>``   the branch to check. Defaults to ``$GITHUB_HEAD_REF`` in CI, and
                     to the branch you have checked out everywhere else.
``--gate-only``      run only steps 4-6. For callers that have already run the
                     linters and the branch guards themselves: CI's policy_check job,
                     and the pre-commit hook.
``--if-cached``      skip the OPA test when any of the resource's fixtures has no
                     committed plan, instead of building one. A missing plan means
                     terraform has to run, and on a fresh clone that first run also
                     downloads the provider mirror — minutes of network, which is
                     not something a git hook may do to you. Used by the pre-commit
                     hook; never use it as your final check before pushing.
``--changed-only``   skip steps whose inputs this commit does not touch, judged from
                     the staged files. Also for the pre-commit hook: it runs on every
                     commit, and most commits change nothing this gate reads.

Exits 0 when everything passed (or was legitimately skipped), 1 on any failure.
"""
import argparse
import json
import os
import subprocess
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(REPO))
sys.path.insert(0, str(REPO / "scripts" / "linters"))
from _service_slug import slug_to_folder  # noqa: E402

# The single definition of which plan belongs to which fixture — imported, never
# re-derived, so --if-cached asks exactly the question auto_test itself asks.
from scripts.auto_test.auto_test import plan_cache_path  # noqa: E402

DOCS, INPUTS, POLICIES = "docs", "inputs", "policies"
LINTERS = REPO / "scripts" / "linters"
AUTO_TEST = str(REPO / "scripts" / "auto_test" / "auto_test.py")

# TODO(after this migration branch merges to dev): confine a Service/ PR's DIFF to
# its selected service. Fail the PR if it changes any docs/, inputs/ or policies/
# file outside `<tree>/<platform>/<folder>/` (service-level, per the owner's intent;
# could tighten to `<folder>/<resource>/` if desired). Add it as a step in the
# policy_check job (gated on Service/ branches) — e.g. compare
# `git diff --name-only origin/<base>...HEAD` against the selected service path.
# DEFERRED because this chore/ branch intentionally modified inputs/policies/docs
# across many services and must not be blocked by such a guardrail.


# --------------------------------------------------------------------------- #
# Reporting
# --------------------------------------------------------------------------- #
class Report:
    """Step results, printed as they happen and summarised at the end.

    Every step reports something — passed, failed or skipped with a reason. A step
    that prints nothing is indistinguishable from a step that did not run, which is
    the failure mode this whole script exists to remove.
    """

    def __init__(self):
        self.rows = []

    def _add(self, mark, step, detail):
        self.rows.append((mark, step, detail))
        line = f"  {mark:<6} {step}"
        print(f"{line}  — {detail}" if detail else line)

    def ok(self, step, detail=""):
        self._add("[OK]", step, detail)

    def fail(self, step, detail=""):
        self._add("[FAIL]", step, detail)

    def skip(self, step, detail=""):
        self._add("[skip]", step, detail)

    @property
    def failed(self):
        return [r for r in self.rows if r[0] == "[FAIL]"]

    def summarise(self, resource):
        print()
        if not self.failed:
            skipped = [r for r in self.rows if r[0] == "[skip]"]
            tail = f" ({len(skipped)} skipped)" if skipped else ""
            print(f"[OK] {resource}: every check passed{tail}.")
            return 0
        print(f"[FAIL] {resource}: {len(self.failed)} check(s) failed:")
        for _, step, detail in self.failed:
            print(f"  - {step}{f' — {detail}' if detail else ''}")
        print("\nFix these before pushing; CI runs the same checks.")
        return 1


def run(cmd, **kwargs):
    """Run a subprocess from the repo root, capturing its output."""
    return subprocess.run([sys.executable, *cmd], cwd=REPO,
                          capture_output=True, text=True, **kwargs)


def show(result):
    """Echo a failed step's own output — it explains itself better than we can."""
    body = (result.stdout or "") + (result.stderr or "")
    for line in body.rstrip().splitlines():
        print(f"      {line}")


# --------------------------------------------------------------------------- #
# Steps 1-3: the checks that apply to any branch
# --------------------------------------------------------------------------- #
def current_branch():
    """The checked-out branch, or None in a detached HEAD / non-git directory."""
    r = subprocess.run(["git", "rev-parse", "--abbrev-ref", "HEAD"],
                       cwd=REPO, capture_output=True, text=True)
    name = r.stdout.strip()
    return name if r.returncode == 0 and name and name != "HEAD" else None


def staged_paths():
    """Repo-relative paths staged for the current commit."""
    r = subprocess.run(["git", "diff", "--cached", "--name-only", "-z"],
                       cwd=REPO, capture_output=True, text=True)
    if r.returncode != 0:
        return None                      # not a git checkout, or nothing to read
    return [p for p in r.stdout.split("\0") if p]


def touches_resource(paths, platform, folder, resource):
    """The staged paths belonging to this resource's docs, fixtures or policies."""
    prefixes = (f"{INPUTS}/{platform}/{folder}/{resource}/",
                f"{POLICIES}/{platform}/{folder}/{resource}/")
    doc = f"{DOCS}/{platform}/{folder}/{resource}.json"
    return [p for p in paths if p == doc or p.startswith(prefixes)]


def touches_opa_inputs(paths):
    """Whether any staged path is something the OPA test actually reads.

    A plan is built from *.tf and evaluated against *.rego. Editing the resource's
    docs JSON changes what doc completeness and coverage say, but cannot change
    what terraform plans or what OPA decides — so the expensive step is skippable
    while the two cheap ones still run.
    """
    return any(p.endswith((".tf", ".rego")) for p in paths)


def base_ref():
    """``origin/dev`` when it exists locally — the reference point CI uses.

    Without it the linters fall back to HEAD, which only sees what is staged. That
    is right for a pre-commit hook and wrong here, so say so rather than silently
    checking less than the name of this script promises.
    """
    r = subprocess.run(["git", "rev-parse", "--verify", "--quiet", "origin/dev"],
                       cwd=REPO, capture_output=True, text=True)
    return "origin/dev" if r.returncode == 0 else None


def step_branch_name(report, branch):
    result = run([str(LINTERS / "check_branch_name.py"), "--branch", branch])
    if result.returncode == 0:
        report.ok("Branch name", branch)
    else:
        report.fail("Branch name", "does not match the naming convention")
        show(result)


def step_branch_scope(report, base):
    if base is None:
        report.skip("Branch scope", "no origin/dev locally — run `git fetch origin`")
        return
    result = run([str(LINTERS / "branch_scope.py"), "--base", base])
    if result.returncode == 0:
        report.ok("Branch scope", "no changes outside this branch's own files")
    elif result.returncode == 2:
        report.skip("Branch scope", (result.stderr or result.stdout).strip().splitlines()[-1:] or "")
    else:
        report.fail("Branch scope", "the branch changes files outside its own resource")
        show(result)


def step_lint(report, base):
    cmd = [str(LINTERS / "run_precommit_linter.py")]
    if base:
        cmd += ["--base", base]
    result = run(cmd)
    if result.returncode == 0:
        report.ok("Lint", "structure and policy content clean for your changes")
    else:
        report.fail("Lint", "structural or content findings in files you changed")
        show(result)


# --------------------------------------------------------------------------- #
# Steps 4-6: the resource gate
# --------------------------------------------------------------------------- #
def parse_branch(branch):
    """Return (platform, slug, resource) for a Service/ branch, else None."""
    parts = branch.split("/")
    if len(parts) == 4 and parts[0] == "Service":
        return parts[1], parts[2], parts[3]
    return None


def leaf_args(doc):
    """Yield (name, entry) for leaf args — those carrying a ``security_impact``
    field. Block args (``type: block``) have no security_impact and are skipped."""
    for name, entry in doc.get("arguments", {}).items():
        if isinstance(entry, dict) and "security_impact" in entry:
            yield name, entry


def check_doc_completeness(doc):
    errors = []
    for name, entry in leaf_args(doc):
        si = entry.get("security_impact")
        if not isinstance(si, bool):
            errors.append(f"arg '{name}': security_impact must be a real true/false "
                          f"(found {si!r}; the \"true/false\" placeholder is not allowed)")
        rationale = entry.get("rationale")
        if not (isinstance(rationale, str) and rationale.strip()):
            errors.append(f"arg '{name}': rationale must be filled in (found {rationale!r})")
    return errors


def check_true_arg_coverage(doc, platform, folder, resource):
    errors = []
    for name, entry in leaf_args(doc):
        if entry.get("security_impact") is True:
            policy = Path(POLICIES) / platform / folder / resource / f"{name}.rego"
            fixture = Path(INPUTS) / platform / folder / resource / name
            if not policy.is_file():
                errors.append(f"true arg '{name}': missing policy {policy}")
            if not fixture.is_dir():
                errors.append(f"true arg '{name}': missing input fixture {fixture}/")
    return errors


def uncached_fixtures(inputs_dir):
    """Fixture dirs under ``inputs_dir`` with no committed plan beside their *.tf."""
    root = REPO / inputs_dir
    if not root.is_dir():
        return []
    return [d for d in sorted(root.rglob("*"))
            if d.is_dir() and any(d.glob("*.tf")) and not plan_cache_path(d).exists()]


def step_opa(report, platform, folder, resource, if_cached):
    inputs = Path(INPUTS) / platform / folder / resource
    policies = Path(POLICIES) / platform / folder / resource

    if if_cached:
        missing = uncached_fixtures(inputs)
        if missing:
            report.skip("OPA test",
                        f"{len(missing)} fixture(s) have no committed plan — terraform would "
                        "have to run. Run `python3 scripts/check_resource.py` before pushing")
            return

    result = run([AUTO_TEST, "--inputs", str(inputs), "--policies", str(policies), "--verbose"])
    if result.returncode == 0:
        report.ok("OPA test", "every policy passes its compliant and non-compliant fixture")
    else:
        report.fail("OPA test", "terraform plan + opa eval did not pass")
        show(result)


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #
def main(argv=None):
    parser = argparse.ArgumentParser(
        description="Run every check CI runs against your resource branch.")
    parser.add_argument("--branch", default=None,
                        help="Branch to check (default: $GITHUB_HEAD_REF, else the "
                             "branch you have checked out).")
    parser.add_argument("--gate-only", action="store_true",
                        help="Run only the resource gate (doc completeness, coverage, OPA), "
                             "skipping the branch and lint checks a caller has already run.")
    parser.add_argument("--if-cached", action="store_true",
                        help="Skip the OPA test when a fixture has no committed plan, rather "
                             "than running terraform to build one.")
    parser.add_argument("--changed-only", action="store_true",
                        help="Skip steps whose inputs the staged files do not touch.")
    args = parser.parse_args(argv)

    branch = args.branch or os.getenv("GITHUB_HEAD_REF") or current_branch()
    if not branch:
        print("[FAIL] could not work out which branch to check — pass --branch <ref>.")
        return 1

    report = Report()
    print(f"Checking branch: {branch}\n")

    if not args.gate_only:
        base = base_ref()
        step_branch_name(report, branch)
        step_branch_scope(report, base)
        step_lint(report, base)

    parsed = parse_branch(branch)
    if not parsed:
        report.skip("Resource gate",
                    "not a Service/<platform>/<service>/<resource> branch, so there is "
                    "no single resource to check")
        return report.summarise(branch)
    platform, slug, resource = parsed

    folder = slug_to_folder(DOCS, platform).get(slug)
    if folder is None:
        report.fail("Resource gate",
                    f"service slug '{slug}' does not match any docs/{platform} service")
        return report.summarise(resource)

    doc_path = REPO / DOCS / platform / folder / f"{resource}.json"
    if not doc_path.is_file():
        report.fail("Resource gate",
                    f"resource doc not found: docs/{platform}/{folder}/{resource}.json")
        return report.summarise(resource)
    # --changed-only: a commit that touches nothing this gate reads cannot change
    # its verdict, so there is nothing to re-run. Same principle as the linters —
    # a hook reports on what this commit did, and the full run before pushing is
    # what confirms the resource as a whole.
    staged = staged_paths() if args.changed_only else None
    if staged is not None:
        mine = touches_resource(staged, platform, folder, resource)
        if not mine:
            report.skip("Resource gate", "this commit changes nothing under "
                                         f"{resource}'s docs, fixtures or policies")
            return report.summarise(resource)
        if not touches_opa_inputs(mine):
            # Docs-only edit: coverage and completeness can move, the plan cannot.
            args.if_cached = True
            staged_opa = False
        else:
            staged_opa = True
    else:
        staged_opa = True

    doc = json.loads(doc_path.read_text(encoding="utf-8"))

    doc_errors = check_doc_completeness(doc)
    if doc_errors:
        report.fail("Doc completeness", f"{len(doc_errors)} argument(s) incomplete")
        for e in doc_errors:
            print(f"      - {e}")
    else:
        report.ok("Doc completeness", "every argument has a real security_impact and a rationale")

    cover_errors = check_true_arg_coverage(doc, platform, folder, resource)
    if cover_errors:
        report.fail("True-arg coverage", f"{len(cover_errors)} gap(s)")
        for e in cover_errors:
            print(f"      - {e}")
    else:
        report.ok("True-arg coverage", "every security-impacting argument has a policy and a fixture")

    # Only spend time on terraform+OPA once the doc and coverage are sound: with a
    # missing policy or fixture the OPA run would fail for a reason already reported.
    if doc_errors or cover_errors:
        report.skip("OPA test", "fix the findings above first")
    elif not staged_opa:
        report.skip("OPA test", "this commit changes no *.tf or *.rego, so the plan "
                                "and the policy verdicts cannot have moved")
    else:
        step_opa(report, platform, folder, resource, args.if_cached)

    return report.summarise(resource)


if __name__ == "__main__":
    sys.exit(main())
