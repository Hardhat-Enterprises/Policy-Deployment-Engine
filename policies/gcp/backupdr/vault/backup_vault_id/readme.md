# Policy: GCP Backup and DR - Backup Vault ID

## 🔍 Purpose

This policy ensures that all **GCP Backup and DR Vaults** use an approved `backup_vault_id`. Assigning a valid and consistent ID to your backup vaults helps with clarity, traceability, and avoids accidental misconfiguration or conflicts across environments.

## ✅ What it checks

- The policy validates the `backup_vault_id` attribute in `google_backup_dr_backup_vault` resources.
- Only values listed in the compliant values are allowed (e.g., `backup-vault-c`).
- If an unapproved ID is found (e.g., `invalid-id-01`), it is flagged as non-compliant.

## 📁 Example Compliant Configuration

```hcl
resource "google_backup_dr_backup_vault" "example" {
  backup_vault_id = "backup-vault-c"
  location        = "australia-southeast1"
  ...
}
```

## ❌ Example Non-Compliant Configuration

```hcl
resource "google_backup_dr_backup_vault" "bad_example" {
  backup_vault_id = "invalid-id-01"
  location        = "australia-southeast1"
  ...
}
```

## 📦 Policy Location

- `policy.rego`: contains the logic to check allowed values.
- `vars.rego`: defines allowed `backup_vault_id` values and metadata.

## 🧪 Run the Policy

To evaluate the policy using OPA:

```bash
opa eval --data ./policies/gcp --input ./inputs/gcp/backupdr/vault/backup_vault_id/plan.json --format pretty \
  "data.terraform.gcp.security.backupdr.vault.backup_vault_id.summary.message"
```

## 📊 Example Output

```json
[
  "Total GCP Backup Vault detected: 2",
  "Non-compliant GCP Backup Vault: 1/2",
  "GCP Backup Vault with invalid ID: 'invalid-id-01'"
]
```
