## 🛡️ Policy Deployment Engine: Linters

The Policy Deployment Engine Linters were developed to enforce structure, consistency, and compliance across Terraform inputs and OPA (Open Policy Agent) policies in multi-cloud security automation.

---

## This document explains:

1. The usage of the linters

2. Libraries and functions used

3. Number and types of checks performed

4. Expected error types and their meaning

5. Functions and their usage

6. How developers can fix common issues

7. Conclusion

---

## 1. Usage

| Command | Description | Example |
|---------|-------------|---------|
| `python linter.py` | Run linter on **all services** under `inputs/gcp` and `policies/gcp`. | `python linter.py` |
| `python linter.py --gcp <service>` | Run linter only for the specified GCP service. | `python linter.py --gcp google_kms` |

---

## 2. Libraries used

No need to download any extra modules, these libraries will be present if you have python installed on your device

| Library |	Purpose |
|---|---|
| 'os' | Directory traversal, path operations |
| 're' |	Regular expressions (regex) for validating filenames and parsing packages |
| 'sys' |	Exiting with status codes |
| 'shutil' |	Checking terraform availability |
| 'subprocess' |	Running terraform fmt |
| 'argparse' |	Handling command-line flags (--gcp) |


## 3. Checks Performed

| Category | Description | Example of Check |
|----------|-------------|------------------|
| **Folder Structure** | Only directories allowed under service and resource levels (with exceptions). | No stray `README.md` in `inputs/gcp/google_kms/`. |
| **Required Files** | Ensures presence of `c.tf`, `nc.tf`, `config.tf`, `plan.json`, `.terraform.lock.hcl`, `plan` for inputs, and `policy.rego`, `vars.rego` for policies. | Missing `config.tf` triggers error. |
| **Excess Files** | Flags extra files that are not part of the required set. | `notes.txt` inside a policy folder. |
| **Naming Conventions** | Enforces lowercase snake_case for `.tf` and `.rego` files. | Rejects `Config.TF`. |
| **Terraform Format** | Runs `terraform fmt -recursive` for consistency. | Indentation and style issues auto-fixed. |
| **Resource Type Match** | Validates Terraform `resource "<TYPE>"` matches its parent resource folder. | `resource "google_kms_key"` in folder `google_kms_crypto_key` fails. |
| **Resource Naming** | Enforces sequential names (`c1, c2...` / `nc1, nc2...`) or plain `c` / `nc` if only one block. | `resource "..." "c3"` without `c1, c2` fails. |
| **Resource Value Name** | The attribute specified in `vars.rego` (e.g., `name`) must equal the resource block name. | `name = "param-c"` with block `c1` fails. |
| **OPA Package Validation** | Ensures Rego `package` matches folder path: `terraform.gcp.security.<service>.<resource>.<policy>`. | Wrong package path flagged. |
| **Vars Package Validation** | Ensures `vars.rego` has package suffix `.vars`. | `package terraform.gcp.security.service.resource` is invalid. |

---

## 4. Expected Errors

| Error Type | Example Message | Fix |
|------------|-----------------|-----|
| Missing file | `[ERROR] Missing files in ... ['c.tf']` | Add missing Terraform/rego files. |
| Excess file | `[ERROR] Excess files in ... ['notes.txt']` | Remove or relocate extra files. |
| Unexpected file | `[ERROR] Unexpected file 'README.md' in ... Only directories allowed.` | Remove or move file. |
| Bad filename | `[ERROR] Bad filename: 'Config.TF'` | Rename file to `config.tf`. |
| Resource type mismatch | `[ERROR] Resource type 'google_param' in c.tf does not match directory 'parameter'` | Fix resource type or folder. |
| Resource name error | `[ERROR] Expected 'c1' but found 'c3' in c.tf` | Rename sequentially (`c1, c2…`). |
| Resource value mismatch | `[ERROR] Wrong name='param-c' in nc.tf; expected 'nc1' or 'nc'` | Fix attribute to match block name. |
| Package mismatch | `[ERROR] Bad package name in policy.rego. Expected terraform.gcp.security.service.resource.policyA` | Correct the `package` declaration. |

---

## 5. Functions Reference

| Function | Location | Purpose |
|----------|----------|---------|
| `check_missing_files` | BaseValidator | Detects missing required files. |
| `check_excess_files` | BaseValidator | Detects extra/unexpected files. |
| `check_only_directories` | BaseValidator | Ensures only directories at service/resource level. |
| `run_terraform_fmt` | BaseValidator | Runs `terraform fmt -recursive`. |
| `read_resource_value_name` | BaseValidator | Reads `resource_value_name` from `vars.rego`. |
| `validate_resource_type_matches_dir` | BaseValidator | Ensures Terraform resource type matches directory name. |
| `validate_resource_name_sequence` | BaseValidator | Enforces sequential or plain block names. |
| `validate_resource_value_names` | BaseValidator | Ensures resource attribute equals block name. |
| `check_package_for_policy` | BaseValidator | Validates `policy.rego` package path. |
| `check_vars_package` | BaseValidator | Ensures `vars.rego` package ends with `.vars`. |
| `validate` | InputValidator / PolicyValidator | Main entry for running all checks. |

---

## 6. 🛠 Developer Guide to Fix Errors

1. Always include all required files per policy folder.

2. Follow naming conventions: lowercase, underscores, .tf / .rego.

3. Ensure Terraform resource TYPE = resource folder name.

4. For resources:

> Use c1, c2, … (or c if only one).

>Use nc1, nc2, … (or nc if only one).

>Make sure the resource value attribute matches the block name.

5. In Rego, ensure the package declaration matches the folder path.

---
## 7. 📖 Conclusion

The linter enforces **structure, compliance, and correctness** across Terraform inputs and OPA Rego policies.  

By following the error messages and applying the recommended fixes, developers can keep the repository **consistent, production-ready, and CI/CD compliant**.
