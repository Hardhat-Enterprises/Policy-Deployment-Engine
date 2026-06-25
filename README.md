# Policy-Deployment-Engine

The Policy Deployment Engine (PDE) is designed to automate and simplify the enforcement of security policies across cloud environments, starting with Google Cloud Platform (GCP) and expanding to AWS and Azure in the future. The project focuses on developing a centralised system to efficiently deploy, manage, and update security policies, ensuring compliance and reducing manual effort. By creating a structured approach to policy implementation, the engine aims to enhance security, improve operational efficiency, and provide organisations with a scalable solution for managing cloud policies. PDE is HardHat's first ever policy-oriented project aimed at securing cloud environments, beginning in T1 2025.

Last updated: T2 2026

## 📋 Contributor Requirements

Before working on a service in PDE, all contributors must follow these steps:

### 1. **Pass the Contributor Test**
You must pass the contributor test to be assigned a service. This ensures you understand the project structure and quality standards. Test will be shared in week 02. 

### 2. **Clone the Repository**
Clone the repository to working on your service. Please note that we do not accept PRs from forked repos. 

```bash
git clone https://github.com/Hardhat-Enterprises/Policy-Deployment-Engine.git
cd Policy-Deployment-Engine
```

### 3. **Create a Branch Following Naming Convention**
All branches must follow one of these patterns:
- `Service/<platform>/<service_slug>/<resource_type>` - When working on a specific resource
  - `<platform>`: `gcp` (aws/azure are placeholders)
  - `<service_slug>`: the underscore slug of a `docs/<platform>` service folder. Docs folder
    names contain spaces/parens (illegal in git branches), so the slug is used — e.g.
    `Cloud Run (v2 API)` → `cloud_run_v2_api`. It maps back to exactly one folder.
  - `<resource_type>`: a documented resource (a `docs/<platform>/<folder>/<resource>.json`)
- `feature/<feature_name>` - For general features (e.g., `feature/add-logging`)
- `chore/<chore_name>` - For maintenance/cleanup work (e.g., `chore/tidy-fixtures`)

This `Service/...` branch is what scopes the per-resource CI gate to the resource you're
working on (doc completeness, policy/input coverage, and the OPA test).

**Examples:**
```bash
# Working on a specific resource
git checkout -b Service/gcp/cloud_run_v2_api/google_cloud_run_v2_service

# Adding a new feature
git checkout -b feature/add-validator

# Maintenance / cleanup
git checkout -b chore/tidy-fixtures
```

### 4. **Install Pre-Commit Hooks**
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
  - chore/<name>
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


