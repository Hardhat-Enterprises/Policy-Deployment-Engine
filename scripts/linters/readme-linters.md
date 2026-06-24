# 🛡️ Policy Deployment Engine — Linters

A single linter, `scripts/linters/linter.py`, enforces structure and
cross-consistency across three trees — `docs/`, `inputs/`, `policies/` —
treating `docs/` as the source of truth that `inputs/` and `policies/` must
reconcile to. It uses only the Python standard library (no extra installs).

There are two supporting scripts:

- `run_precommit_linter.py` — runs the linter but fails only on **your** changed
  files (so you are never blocked by the repo-wide backlog).
- `check_branch_name.py` — enforces the branch naming convention.

---

## 1. Usage

```bash
# from the repo root
python scripts/linters/linter.py                      # lint every tree
python scripts/linters/linter.py --tree docs
python scripts/linters/linter.py --tree inputs --platform gcp
python scripts/linters/linter.py --tree policies
python scripts/linters/linter.py --content-checks     # also read inside files (see §3)
```

Exit code is `1` if any error is found, else `0`.

---

## 2. Structural rules (always on)

The structural pass never opens a `.tf`/`.rego` file (it does parse docs JSON).

- **docs/** — only the platform folders (`gcp`, `aws`, `azure`); `gcp/<service>/`
  holds one `*.json` per resource, each matching the doc schema (`last_updated`,
  `provider_version`, `arguments`).
- **inputs/** — reconciles **exactly** to docs:
  `inputs/gcp/<service>/<resource>/<argument>/` where `<service>` and `<resource>`
  match a `docs/gcp/<service>/<resource>.json`, and `<argument>` is a **non-block**
  argument key in that doc. Each argument dir must contain `compliant.tf`,
  `config.tf`, `nonCompliant.tf` (terraform artifacts tolerated; anything else flagged).
- **policies/** — same taxonomy, but each argument is a single `<argument>.rego`
  file plus an optional per-resource `_vars.rego` (underscore-prefixed so it is
  never mistaken for a policy).

---

## 3. Content checks (opt-in: `--content-checks`)

These read inside files. They are **off by default** because a known fixture
backlog has not been migrated yet (see `FIXTURE_BACKLOG.md`).

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
`run_precommit_linter.py` runs the whole-tree linter with `--content-checks`
but fails only on error lines whose path intersects the files you changed.
Pre-existing backlog errors elsewhere are reported as a count, never blocking.

```bash
python scripts/linters/run_precommit_linter.py            # staged + unstaged (pre-commit)
python scripts/linters/run_precommit_linter.py --base origin/dev   # everything vs dev (CI)
python scripts/linters/run_precommit_linter.py --all      # whole tree, fail on any error
```

**CI (`.github/workflows/policy_check_PR.yaml`):** a `lint` job runs
(1) `linter.py --tree all` as a hard structural gate, and
(2) `run_precommit_linter.py --base origin/<base>` to enforce content checks on
the PR's own files.

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

See `FIXTURE_BACKLOG.md` for the fixtures still pending this migration.
