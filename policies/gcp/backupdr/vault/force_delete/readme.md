🔐 force_delete Policy – GCP Backup Vault Compliance
This policy ensures that all GCP Backup Vaults (google_backup_dr_backup_vault) have the force_delete attribute set to true. Enabling force_delete allows backup vaults to be deleted even if certain constraints (e.g., empty datasources or active backup plan references) are present. This can help ensure that automation or cleanup pipelines work reliably.

📂 Location
Policy File: policies/gcp/backupdr/vault/force_delete/policy.rego

Vars File: policies/gcp/backupdr/vault/force_delete/vars.rego

Terraform Plan Input: inputs/gcp/backupdr/vault/force_delete/plan.json

✅ Compliance Rule
Each GCP Backup Vault must have:

hcl
Copy
Edit
force_delete = true
📜 What the Policy Checks
All resources of type google_backup_dr_backup_vault.

For each resource, whether the force_delete attribute is set to true.

Flags any backup vaults where it is not.

🛠️ How to Run the Policy
Use the following command to evaluate compliance:

bash
Copy
Edit
opa eval \
  --data ./policies/gcp \
  --input ./inputs/gcp/backupdr/vault/force_delete/plan.json \
  --format pretty \
  "data.terraform.gcp.security.backupdr.vault.force_delete.summary.message"
🧾 Example Output
arduino
Copy
Edit
[
  "Total GCP Backup Vaults found: 2",
  "Non-compliant GCP Backup Vaults: 1/2",
  "GCP Backup Vault 'backup-vault-nc' does not have 'force_delete' set to true"
]
🔍 Why This Policy Matters
Automation-friendly: Avoids failures when trying to destroy backup vaults that are empty but still referenced.

Safety: Ensures you have explicitly configured vaults to allow deletion when appropriate.

Terraform Best Practices: Keeps your infrastructure aligned with compliance requirements or organizational guidelines.