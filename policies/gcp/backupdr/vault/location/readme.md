# 🕒 Retention Policy – GCP Backup Vault Compliance

This policy ensures that all Google Cloud Platform (GCP) Backup Vaults (`google_backup_dr_backup_vault`) are configured with a minimum retention duration of exactly 86400 seconds (24 hours). This helps prevent accidental or premature deletion of backups, supporting essential data retention requirements for compliance and effective disaster recovery strategies.

## 📂 Policy Structure

This policy is organized within the following directory structure:

```
policies/gcp/backupdr/vault/retention/
├── policy.rego  # The main Rego policy file
└── vars.rego    # Variable definitions for the policy
inputs/gcp/backupdr/vault/retention/
└── plan.json    # Example Terraform plan input file
```

## ✅ Compliance Requirement

A GCP Backup Vault is considered compliant if its `backup_minimum_enforced_retention_duration` attribute is set to `"86400s"`.

```hcl
# Example of a compliant configuration
resource "google_backup_dr_backup_vault" "compliant_vault" {
  # ... other configurations ...
  backup_minimum_enforced_retention_duration = "86400s"
}
```

## 📜 What This Policy Checks

This policy examines all resources of type `google_backup_dr_backup_vault` within your Terraform plan. For each Backup Vault, it verifies that the value of the `backup_minimum_enforced_retention_duration` attribute is exactly `"86400s"`. Any Backup Vault found with a different retention duration will be flagged as non-compliant.

## 🛠️ How to Evaluate Compliance

To check your Terraform plan against this policy, use the Open Policy Agent (OPA) command-line tool. Ensure you have OPA installed.

1.  Navigate to the root directory of your policy repository.
2.  Execute the following command:

    ```bash
    opa eval \
      --data ./policies/gcp \
      --input ./inputs/gcp/backupdr/vault/retention/plan.json \
      --format pretty \
      "data.terraform.gcp.security.backupdr.vault.retention.summary.message"
    ```

    * `--data ./policies/gcp`: Specifies the directory containing your policy files.
    * `--input ./inputs/gcp/backupdr/vault/retention/plan.json`: Points to your Terraform plan file in JSON format.
    * `--format pretty`: Formats the output for better readability.
    * `"data.terraform.gcp.security.backupdr.vault.retention.summary.message"`: Specifies the Rego path to evaluate, which will output the summary message.

## 🧾 Example Output

Here's an example of the output you might see when running the policy against a Terraform plan:

```
[
  "Total GCP Backup Vaults found: 2",
  "Non-compliant GCP Backup Vaults: 1/2",
  "GCP Backup Vault 'backup-vault-nc' uses unapproved backup minimum enforced retention duration: '3600s'"
]
```

In this example, the policy found two GCP Backup Vaults. One vault (`backup-vault-nc`) was found to be non-compliant because its `backup_minimum_enforced_retention_duration` was set to `3600s` instead of the required `86400s`.

## 🔍 Why This Policy is Important

* **Ensures Data Protection:** By enforcing a minimum retention period, this policy helps safeguard your valuable backup data from accidental or premature deletion.
* **Supports Disaster Recovery:** Maintaining backups for a sufficient duration is crucial for effective disaster recovery planning and execution.
* **Aids Compliance Efforts:** Many regulatory frameworks and organizational policies mandate specific data retention periods. This policy helps ensure your GCP Backup Vault configurations align with these requirements.

By implementing and regularly running this policy, you can maintain a secure and compliant backup infrastructure on GCP.
