# 🔒 Force Delete Policy – GCP Backup Vault Compliance

This policy verifies that all Google Cloud Platform (GCP) Backup Vaults (`google_backup_dr_backup_vault`) have the `force_delete` attribute explicitly set to `true`. Enabling `force_delete` is crucial for ensuring that Backup Vaults can be successfully deleted even when they contain data sources or are referenced by active backup plans. This is particularly important for automation scripts and cleanup processes, preventing them from getting stuck due to deletion constraints.

## 📂 Policy Structure

This policy is organized within the following directory structure:

```
policies/gcp/backupdr/vault/force_delete/
├── policy.rego  # The main Rego policy file
└── vars.rego    # Variable definitions for the policy
inputs/gcp/backupdr/vault/force_delete/
└── plan.json    # Example Terraform plan input file
```

## ✅ Compliance Requirement

A GCP Backup Vault is considered compliant if its `force_delete` attribute is explicitly set to `true`.

```hcl
# Example of a compliant configuration
resource "google_backup_dr_backup_vault" "compliant_vault" {
  # ... other configurations ...
  force_delete = true
}
```

## 📜 What This Policy Checks

This policy examines all resources of type `google_backup_dr_backup_vault` within your Terraform plan. For each Backup Vault, it checks whether the `force_delete` attribute is set to `true`. Any Backup Vault where `force_delete` is either `false` or not explicitly set will be flagged as non-compliant.

## 🛠️ How to Evaluate Compliance

To check your Terraform plan against this policy, use the Open Policy Agent (OPA) command-line tool. Ensure you have OPA installed.

1.  Navigate to the root directory of your policy repository.
2.  Execute the following command:

    ```bash
    opa eval \
      --data ./policies/gcp \
      --input ./inputs/gcp/backupdr/vault/force_delete/plan.json \
      --format pretty \
      "data.terraform.gcp.security.backupdr.vault.force_delete.summary.message"
    ```

    * `--data ./policies/gcp`: Specifies the directory containing your policy files.
    * `--input ./inputs/gcp/backupdr/vault/force_delete/plan.json`: Points to your Terraform plan file in JSON format.
    * `--format pretty`: Formats the output for better readability.
    * `"data.terraform.gcp.security.backupdr.vault.force_delete.summary.message"`: Specifies the Rego path to evaluate, which will output the summary message.

## 🧾 Example Output

Here's an example of the output you might see when running the policy against a Terraform plan:

```
[
  "Total GCP Backup Vaults found: 2",
  "Non-compliant GCP Backup Vaults: 1/2",
  "GCP Backup Vault 'backup-vault-nc' does not have 'force_delete' set to true"
]
```

In this example, the policy identified two GCP Backup Vaults. One vault (`backup-vault-nc`) was found to be non-compliant because the `force_delete` attribute was either set to `false` or not explicitly defined in its configuration.

## 🔍 Why This Policy Matters

* **Facilitates Automation:** Ensures that automated scripts and pipelines for infrastructure management can reliably delete Backup Vaults when needed, without encountering blocking constraints.
* **Supports Cleanup Processes:** Enables efficient cleanup of resources, preventing orphaned or undeletable Backup Vaults from accumulating.
* **Reduces Operational Overhead:** By avoiding manual intervention to force-delete vaults, this policy contributes to smoother and more efficient operations.
* **Explicit Configuration:** Enforces the explicit declaration of the `force_delete` behavior, promoting clarity and preventing unintended consequences during deletion.

By implementing and regularly running this policy, you can ensure that your GCP Backup Vaults are configured to allow for seamless deletion when necessary, improving the reliability and efficiency of your infrastructure management processes.
