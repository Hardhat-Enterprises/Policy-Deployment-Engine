# 🛡️ Policy Deployment Engine — Linters

A single linter, `scripts/linters/linter.py`, enforces structure and
cross-consistency across two trees — `docs/` and `policies/` — treating
`docs/` as the source of truth that `policies/` must reconcile to. It uses only the Python standard library (no extra installs).

There are four supporting scripts:

- `run_precommit_linter.py` — runs the linter but fails only on **your** changed
  files (so you are never blocked by the repo-wide backlog). It also runs
  `policy_lint.py` (below) over every resource type your changed files belong
  to, and there it fails only on the findings your change **introduced** —
  measured against the base tree — so a pre-existing finding inside a file you
  merely touched is reported as context, not as your fault.
- `check_branch_name.py` — enforces the branch naming convention.
- `branch_scope.py` — enforces that a `Service/<platform>/<service_slug>/<resource_type>`
  branch changes **only** that resource's files (`docs/` JSON, `inputs/`,
  `policies/`), plus additions to `inputs/plan_cache/`. It catches the two
  silent mistakes — editing the shared harness and wiping the plan cache —
  neither of which fails any test on the branch that caused it. Rules are
  documented in `Guide/Policy_writing_tutorial/branch-scope.md`.
- `policy_lint.py` — deterministic *content*-quality rules over a policy kit's
  declared `conditions`/`variables` (hard-coded literals, trivial messages,
  fixture drift, ...). It answers whether the policy is any good, not just
  whether the trees reconcile. Every rule and how to run it standalone is
  documented in `Guide/Policy_writing_tutorial/policy-lint.md`.

---

## 1. Usage

```bash
# from the repo root
python scripts/linters/linter.py                      # lint every tree
python scripts/linters/linter.py --tree docs
python scripts/linters/linter.py --tree policies --platform gcp
python scripts/linters/linter.py --no-content-checks  # structural only (skip §3 checks)
```

Exit code is `1` if any error is found, else `0`.

---

## 2. Structural rules (always on)

The structural pass never opens a `.tf`/`.rego` file (it does parse docs JSON).

- **docs/** — only the platform folders (`gcp`, `aws`, `azure`); `gcp/<service>/`
  holds one `*.json` per resource, each matching the doc schema (`last_updated`,
  `provider_version`, `arguments`).
- **policies/** — reconciles **exactly** to docs:
  `policies/gcp/<service>/<resource>/<argument>/` where `<service>` and `<resource>`
  match a `docs/gcp/<service>/<resource>.json`, and `<argument>` is a **non-block**
  argument key in that doc. Each argument dir contains exactly `policy.rego`,
  `compliant.tf` and `nonCompliant.tf` — nothing else. Each resource dir may add one
  `_vars.rego` (underscore-prefixed so it is never mistaken for an argument dir), and
  `policies/gcp/` carries the single shared `config.tf`.

---

## 3. Content checks (on by default; `--no-content-checks` to skip)

These read inside files. They run by default (the fixture backlog is cleared and
the whole tree passes). Pass `--no-content-checks` for structural validation only.

- **A — rego package path:** each `.rego` `package` is
  `terraform.gcp.security.<service>.<resource>.<seg>` (`<seg>` = filename stem with
  `.`→`_`; `_vars.rego` → `.<resource>.vars`). The `<service>` segment is not asserted.
- **B — single tested resource:** a `compliant.tf` / `nonCompliant.tf` contains
  **only** the tested resource type (== its dir). Dependency resources are
  disallowed — we run `terraform plan` only, so the tested resource uses fake
  values instead of real dependencies.
- **C — example labels:** tested-resource labels are `compliant_example_N`
  (`compliant.tf`) / `non_compliant_example_N` (`nonCompliant.tf`), sequential from
  1, always suffixed (even when there is only one). The `resource_value_name`
  attribute (from `_vars.rego`) stays coupled to the label.

---

## 4. Pre-commit & CI

**Local (`pre-commit install`, config in `.pre-commit-config.yaml`):**
`run_precommit_linter.py` runs the whole-tree linter (content checks on by
default) but fails only on errors in the files you changed. For input fixtures the unit
is the whole **argument directory** — `compliant.tf` and `nonCompliant.tf` test
one argument together, so touching one means you own the pair. Policies/docs are
file-level. Pre-existing backlog errors elsewhere are counted, never blocking.

It also runs `policy_lint.py` over every resource type a changed file belongs
to, and fails on an error-severity finding only when the specific `.rego` file
(or fixture pair) it names was itself changed — see
`Guide/Policy_writing_tutorial/policy-lint.md`.

**Blame is limited to what you introduced.** Within a file you did change, a
`policy_lint` finding fails the run only if it is not already there on the base
tree. The same resource types are linted a second time against a detached
`git worktree` of the base commit (the merge-base with `--base <ref>`, else
`HEAD`), thrown away afterwards, and anything present in both is printed under a
`[NOTE]` line as context instead of failing. Consequences worth knowing:

- Removing findings can never fail. A mechanical cleanup PR passes.
- A finding is identified by `(rule, service, resource, policy)` — **not** the
  message, because messages carry line numbers and counts that shift when a file
  is legitimately edited, and a shifted message must not read as a new problem.
- Identities are compared by **count**, so one `hard-coded-value` in a file
  becoming two still fails.
- The base tree is built only when something is owned at HEAD, and only the
  resource types that produced one of those findings are linted on it — a clean
  change never pays for it at all. Measured: +0s on a clean one-resource PR,
  ~1.7s on a one-resource PR that inherits a finding, ~3.1s on a 234-resource-type
  cleanup PR.
- If the base ref is not in the clone (a shallow CI checkout), the gate **fails
  loudly** rather than treating the whole backlog as newly introduced. CI must
  check out with `fetch-depth: 0`.

```bash
python scripts/linters/run_precommit_linter.py            # staged + unstaged (pre-commit)
python scripts/linters/run_precommit_linter.py --base origin/dev   # everything vs dev (CI)
python scripts/linters/run_precommit_linter.py --all      # whole tree, fail on any error

python scripts/linters/branch_scope.py --staged           # what you are about to commit
python scripts/linters/branch_scope.py --base origin/dev  # the whole branch vs dev (CI)
```

**CI (`.github/workflows/branch-scope.yml`):** a `branch_scope` job runs
`branch_scope.py --branch <head ref> --base origin/<base>` on every pull request
from a `Service/` branch. It is a **separate workflow with no `paths:` filter**
on purpose: `policy_check_PR.yaml` only runs when `docs/`, `inputs/` or
`policies/` changed, so a branch whose only change is to `scripts/` or to a
stray committed binary would never trigger it — and those are exactly the
changes the scope check exists to catch.

**CI (`.github/workflows/policy_check_PR.yaml`):** a `lint` job runs
(1) `linter.py --tree all --no-content-checks` as a hard whole-tree structural
gate (structural only, so it never blocks a PR on repo-wide content debt), and
(2) `run_precommit_linter.py --base origin/<base>` to enforce structural + content
checks (including `policy_lint.py`, which needs OPA installed in the job) on the
PR's own changed files.

`.github/workflows/policy_check_ALL.yaml` (on every push to `dev`) additionally
runs `policy_lint.py --json gcp` over the whole tree as a `continue-on-error`
report, publishing `policy-lint-report.json` as a build artifact for
maintainers to track the content-quality backlog — it never blocks.

---

## 5. Common errors & fixes

| Message | Fix |
|---|---|
| `... does not match any docs/gcp service` / `resource type not documented` | The dir name must equal a `docs/gcp/<service>/<resource>.json`. |
| `not a documented argument key` | Rename the argument dir/file to the exact (non-block) docs key. |
| `missing required file(s) ['compliant.tf']` | Add the required fixture files. |
| `[content] ... package '...' must end with '.<resource>.<seg>'` | Fix the rego `package` to match its path. |
| `[content] ... dependency resource(s) [...] not allowed` | Remove the dependency; give the tested resource fake values. |
| `[content] ... resource label 'c' should be 'compliant_example_1'` | Adopt the example label convention. |
