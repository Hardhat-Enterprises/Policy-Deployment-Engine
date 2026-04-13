# Policy-Deployment-Engine

The Policy Deployment Engine (PDE) is designed to automate and simplify the enforcement of security policies across cloud environments, starting with Google Cloud Platform (GCP) and expanding to AWS and Azure in the future. The project focuses on developing a centralised system to efficiently deploy, manage, and update security policies, ensuring compliance and reducing manual effort. By creating a structured approach to policy implementation, the engine aims to enhance security, improve operational efficiency, and provide organisations with a scalable solution for managing cloud policies. PDE is HardHat's first ever policy-oriented project aimed at securing cloud environments, beginning in T1 2025.

<<<<<<< HEAD
Last updated: T2 2025
=======
Last updated: T3 2025

## 📋 Contributor Requirements

Before working on a service in PDE, all contributors must follow these steps:

### 1. **Pass the Contributor Test**
You must pass the contributor test to be assigned a service. This ensures you understand the project structure and quality standards. Test will be shared in week 02. 

### 2. **Clone the Repository**
Clone the repository to working on your service. Please note that we do not accept PRs from forked repos. 

```bash
git clone https://github.com/your-org/Policy-Deployment-Engine.git
cd Policy-Deployment-Engine
```

### 3. **Create a Branch Following Naming Convention**
All branches must follow one of these patterns:
- `gcp/service/<service_name>` - When working on a specific GCP service (e.g., `gcp/service/biglake`)
- `feature/<feature_name>` - For general features (e.g., `feature/add-logging`)
- `fix/<fix_name>` - For bug fixes (e.g., `fix/rego-syntax`)

**Examples:**
```bash
# Working on BigLake service
git checkout -b gcp/service/biglake

# Adding a new feature
git checkout -b feature/add-validator

# Fixing a bug
git checkout -b fix/unicode-error
```

### 4. **Install Pre-Commit Hooks**
All commits are automatically validated using pre-commit hooks. Install them with:

```bash
pre-commit install
```

This will enforce:
- ✅ **Policy Linter** - Validates policy and input folder structure
- ✅ **Branch Naming Convention** - Ensures your branch name follows the required format

### ⚠️ What Happens During Commit

When you commit, the pre-commit hooks will run automatically:

1. **Policy Linter Check**
   - Validates all changed policies and inputs
   - Checks for required files (e.g., `vars.rego`, `policy.rego`)
   - Ensures folder structure is correct
   - If errors are found, the commit is **blocked**

2. **Branch Name Check**
   - Verifies your current branch follows the naming convention
   - If invalid, the commit is **blocked**

**Example error message:**
```
[FAIL] Branch 'my-branch' does not match naming convention.
Expected formats:
  - gcp/service/<service_name> (e.g., gcp/service/biglake)
  - feature/<feature_name> (e.g., feature/add-validator)
  - fix/<fix_name> (e.g., fix/unicode-error)
```

### ✅ Making a Successful Commit

1. Make your changes
2. Stage files: `git add .`
3. Commit: `git commit -m "your message"`
4. Fix any errors reported by pre-commit hooks
5. Stage again and commit until no errors appear
6. Push: `git push origin your-branch`
>>>>>>> origin/dev


