🕒 retention Policy – GCP Backup Vault Compliance
This policy ensures that all GCP Backup Vaults (google_backup_dr_backup_vault) enforce a minimum retention duration of exactly 86400s (24 hours). This prevents backups from being deleted too soon and supports data retention policies required for compliance and disaster recovery.

📂 Location
Policy File: policies/gcp/backupdr/vault/retention/policy.rego

Vars File: policies/gcp/backupdr/vault/retention/vars.rego

Terraform Plan Input: inputs/gcp/backupdr/vault/retention/plan.json

✅ Compliance Rule
Each GCP Backup Vault must have:

hcl
Copy
Edit
backup_minimum_enforced_retention_duration = "86400s"
📜 What the Policy Checks
All resources of type google_backup_dr_backup_vault.

For each resource, whether the backup_minimum_enforced_retention_duration attribute is exactly "86400s".

Flags any backup vaults with an incorrect retention value.

🛠️ How to Run the Policy
Use the following command to evaluate compliance:

bash
Copy
Edit
opa eval \
  --data ./policies/gcp \
  --input ./inputs/gcp/backupdr/vault/retention/plan.json \
  --format pretty \
  "data.terraform.gcp.security.backupdr.vault.retention.summary.message"
🧾 Example Output
arduino
Copy
Edit
[
  "Total GCP Backup Vaults found: 2",
  "Non-compliant GCP Backup Vaults: 1/2",
  "GCP Backup Vault 'backup-vault-nc' uses unapproved backup minimum enforced retention duration: '3600s'"
]
🔍 Why This Policy Matters
Data Protection: Ensures backups are retained for a safe minimum period.

Disaster Recovery: Protects against accidental early deletion of data.

Compliance: Aligns with organizational policies for data retention and security.