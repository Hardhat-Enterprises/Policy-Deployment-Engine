# Policy-Deployment-Engine

The Policy Deployment Engine (PDE) is designed to automate and simplify the enforcement of security policies across cloud environments, starting with Google Cloud Platform (GCP) and expanding to AWS and Azure in the future. The project focuses on developing a centralised system to efficiently deploy, manage, and update security policies, ensuring compliance and reducing manual effort. By creating a structured approach to policy implementation, the engine aims to enhance security, improve operational efficiency, and provide organisations with a scalable solution for managing cloud policies. PDE is HardHat's first ever policy-oriented project aimed at securing cloud environments, beginning in T1 2025.

Last updated: 2026-06-25

## 📁 Repository layout

Three trees mirror each other, keyed off the **docs taxonomy** (the linter enforces that
`inputs/` and `policies/` reconcile to `docs/`):

```
docs/<platform>/<Service>/<resource>.json        # SOURCE OF TRUTH: every argument of a
                                                  #   resource + its security assessment
inputs/<platform>/<Service>/<resource>/<arg>/     # Terraform fixture per argument:
                                                  #   compliant.tf, nonCompliant.tf, config.tf,
                                                  #   <sha>.json — its committed terraform plan
policies/<platform>/<Service>/<resource>/<arg>.rego   # one Rego policy per argument
policies/_helpers/                                # shared Rego helpers (+ _vars.rego per resource)

templates/<platform>/   # starter files the folder_generator copies for a new resource
tests/_helpers/         # Rego unit tests for the shared helpers
scripts/                # tooling — see "Tooling" below
```

`<platform>` is `gcp` today (aws/azure are placeholders). A `<Service>` folder is the
verbatim provider subcategory (e.g. `Cloud Storage`); `<resource>` is the full type
(e.g. `google_storage_bucket`); `<arg>` is a documented, non-block argument key.

## 📋 Contributor Requirements

Before working on a service in PDE, all contributors must follow these steps:

### 1. **Clone the Repository**
Clone the repository to working on your service. Please note that we do not accept PRs from forked repos. 

```bash
git clone https://github.com/Hardhat-Enterprises/Policy-Deployment-Engine.git
cd Policy-Deployment-Engine
```

### 2. **Create a Branch Following Naming Convention**
All branches must follow one of these patterns:
- `Service/<platform>/<service_slug>/<resource_type>` - When working on a specific resource
  - `<platform>`: `gcp` (aws/azure are placeholders)
  - `<service_slug>`: the underscore slug of a `docs/<platform>` service folder. Docs folder
    names contain spaces/parens (illegal in git branches), so the slug is used — e.g.
    `Cloud Run (v2 API)` → `cloud_run_v2_api`. It maps back to exactly one folder.
  - `<resource_type>`: a documented resource (a `docs/<platform>/<folder>/<resource>.json`)
- `feature/<feature_name>` - For general features and any non-resource maintenance/cleanup work (e.g., `feature/add-logging`)

This `Service/...` branch is what scopes the per-resource CI gate to the resource you're
working on (doc completeness, policy/input coverage, and the OPA test).

**Examples:**
```bash
# Working on a specific resource
git checkout -b Service/gcp/cloud_run_v2_api/google_cloud_run_v2_service

# Adding a feature, or any non-resource maintenance/cleanup work
git checkout -b feature/add-validator
```

### 3. **Install Pre-Commit Hooks**
All commits are automatically validated using pre-commit hooks. Install them with:

```bash
pre-commit install
```

This will enforce:
- ✅ **Linter** - Validates the `docs/`, `inputs/`, and `policies/` trees against the docs taxonomy
- ✅ **Branch Naming Convention** - Ensures your branch name follows the required format

### ⚠️ What Happens During Commit

When you commit, the pre-commit hooks will run automatically:

1. **Linter Check** (`scripts/linters/linter.py` via `run_precommit_linter.py`)
   - Validates folder structure and reconciles `inputs/`/`policies/` to `docs/`
   - Checks per-resource files: `inputs/` arg dirs need `compliant.tf`, `config.tf`,
     `nonCompliant.tf`; `policies/` resources have `<argument>.rego` + optional `_vars.rego`
   - With content checks: fixtures contain only the tested resource type (no
     dependencies) and use the `compliant_example_N` / `non_compliant_example_N` labels
   - **Only fails on what you changed** (for input fixtures, the whole argument
     directory — so editing `compliant.tf` also holds you to its `nonCompliant.tf`)
     — the repo-wide backlog never blocks you
   - If errors are found in your changes, the commit is **blocked**

2. **Branch Name Check**
   - Verifies your current branch follows the naming convention
   - If invalid, the commit is **blocked**

**Example error message:**
```
[FAIL] Invalid branch name

Allowed branch names:
  - feature/<name>
  - Service/<platform>/<service_slug>/<resource_type>
      e.g. Service/gcp/cloud_run_v2_api/google_cloud_run_v2_service
  - (protected: dev)
```

### ✅ Making a Successful Commit

1. Make your changes
2. Stage files: `git add .`
3. Commit: `git commit -m "your message"`
4. Fix any errors reported by pre-commit hooks
5. Stage again and commit until no errors appear
6. Push: `git push origin your-branch`

## 🧪 Testing Your Policies Locally

Before opening a PR, run the OPA test suite. It confirms each fixture compiles and that the
policy flags the `non_compliant_example_N` resources **and not** the `compliant_example_N`
ones. The same check runs in CI.

Pass a single **target** — `<platform>[/<service>[/<resource>]]` — and the runner derives
both the `inputs/` and `policies/` roots for you (quote service names that contain spaces):

```bash
# One resource (recommended while you work):
python3 scripts/auto_test/auto_test.py "gcp/Cloud Storage/google_storage_bucket"

# Whole service:
python3 scripts/auto_test/auto_test.py "gcp/Cloud Storage"

# Whole platform:
python3 scripts/auto_test/auto_test.py gcp

# Whole repo (every platform — today that's just gcp):
python3 scripts/auto_test/auto_test.py
```

Add `--verbose` for per-pair detail, or `--workers N` to change parallelism (default 4).
(The explicit `--inputs <root> --policies <root>` flags still work for advanced/CI use, but
can't be combined with a target.)

Output is quiet — a live progress line, **only failures are printed**, then a one-line
summary:

```
[100.0%] 1021/1021  ✅ 1021  ❌ 0  40s
✅ all passed — 94 services, 370 resource types, 1021 policies  in 40s
```

### How it works (and why it's fast)

For each policy the runner produces a `terraform plan` of the fixture, converts it to JSON,
and evaluates the policy with `opa`. Because the fixtures are static, each plan is
**committed inside the fixture directory** as `<sha>.json`, beside the `*.tf` files it was
planned from (the `<sha>` is a hash of those `*.tf` files + the provider version):

- **Plan already committed** → it is fed straight to OPA and **Terraform is not run at all**.
  A full run is ~40s and needs only `opa` installed.
- **You changed a fixture's `.tf`** → its hash changes, so just that fixture re-runs
  `terraform plan`, the new `<sha>.json` is written beside it, and the plan of the old
  version is deleted in the same step. **Commit both** — the new file and the deletion —
  alongside your fixture change. A fixture always has exactly one committed plan, and the
  filename is what proves it belongs to the `*.tf` next to it: a plan that no longer matches
  can't be mistaken for a valid one, because the harness would be looking for a different
  name.

The file is a plain `terraform show -json` document, so you can read it with `jq` like any
other plan.

`fixture_sha()` and `plan_cache_path()` in `scripts/auto_test/auto_test.py` are the only
definition of which plan belongs to which fixture. The linters and the PDE Portal import them
rather than re-deriving a path or a hash — which is why a provider bump, or the move out of
`inputs/plan_cache/`, changes the answer everywhere at once. Import them; don't inline them.

> Plans used to live in one shared `inputs/plan_cache/<platform>/<sha>.json` tree. A branch cut
> before that move carries its own entries there through a merge of `dev`; the next `auto_test.py`
> run moves them into the right fixture directories for you (`adopted N plan(s) from the pre-move
> inputs/plan_cache/ layout`) rather than re-planning anything. Commit what it moved.

### Prerequisites

- **`opa`** — always required (every test evaluates a policy).
- **`terraform`** — only needed when you change a fixture (a cache miss). The first such run
  builds a **project-local, offline** provider cache under `.terraform-cache/` (gitignored;
  it never touches your global `~/.terraform.d` or other projects):

  ```bash
  bash scripts/auto_test/cache_setup.sh   # one-time per machine
  ```

  `auto_test.py` runs this automatically if the cache is missing, so usually you don't need
  to call it yourself.

> **No pruning step.** A stale plan is a file in the fixture's own directory whose name is
> not the fixture's current sha, so the harness deletes it as it writes the replacement — on
> a single-resource run just as correctly as on a full pass. CI changes nothing back: the
> runner is ephemeral, and everything it would write is already committed.

## 🛠 Tooling (`scripts/`)

| Tool | What it does | Docs |
|------|--------------|------|
| `scripts/check_resource.py` | **Start here.** Runs every check CI runs against your branch — branch name, scope, lint, doc completeness, argument coverage, OPA test — and names the one that failed. | [Testing your policies](Guide/Policy_writing_tutorial/testing-policies.md) |
| `scripts/docgen/` | Generates the `docs/` JSON (one file per resource, every argument) from the Terraform provider **schema**; `apply_canonical.py` re-applies the locked cross-cutting assessments (location/region/zone, IAM) to existing files. | [README](scripts/docgen/README.md) |
| `scripts/linters/` | Validates that `docs/`, `inputs/`, and `policies/` reconcile (structure + content) and checks the branch-name convention. | [README](scripts/linters/readme-linters.md) |
| `scripts/auto_test/` | `terraform plan` + `opa eval` harness over the fixtures, with a committed plan cache and an offline project-local provider cache. | "Testing Your Policies Locally" above |
| `scripts/folder_generator/` | Small GUI to scaffold a new resource's input + policy files from `templates/`. | [README](scripts/folder_generator/README.md) |

## 🤖 Continuous integration

Two GitHub Actions workflows in `.github/workflows/`:

- **`policy_check_PR`** — runs on every PR that touches `docs/`, `inputs/`, `policies/`, or the
  tooling that validates them (`scripts/`, `templates/`, `tests/`, `.github/workflows/`):
  - *lint* job (all PRs): branch-name convention → whole-tree **structural** lint → the tools'
    own **test suite** → a **content** lint scoped to the files this PR changed (the repo-wide
    backlog never blocks you).
  - *policy_check* job (only `Service/...` PRs): the per-resource gate — doc completeness
    (real `security_impact` + rationale), policy/input coverage for every `true` arg, and the
    `terraform plan` + OPA test. It then applies a `CI-Approved` / `CI-Review-Required` label.
- **`policy_check_ALL`** — full-tree sweep on every push to `dev`, and on demand
  (`workflow_dispatch`): whole-tree lint + the complete OPA suite. It publishes the
  `policy-results` artifact the PDE Portal backend reads for the repo-wide baseline, so don't
  rename that upload.
- **`branch-scope`** — a `Service/` branch may only change its own resource's files.
- **`pr-target`** — closes any pull request that does not target `dev` or `main`, with an
  explanation on the PR.

The *lint* and *policy_check* jobs run the same script you run locally
(`scripts/check_resource.py`, with `--gate-only` for the resource job since the lint job has
already covered the rest), so a green local run means a green CI run.

A PR is blocked when a lint error lands on a file it changed, or (for `Service/` PRs) when the
per-resource gate fails. Terraform and OPA versions are pinned in the workflows for
reproducibility (the provider version is pinned via `scripts/auto_test/provider_version.txt`).


