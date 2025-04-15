package terraform.gcp.security.backupdr.vault.backup_vault_id

attribute_path := "backup_vault_id"
compliant_values := ["backup-vault-c"]

resources := [r |
  r := input.planned_values.root_module.resources[_]
  r.type == "google_backup_dr_backup_vault"
]

non_compliant := [r |
  r := resources[_]
  not r.values[attribute_path] == "backup-vault-c"
]

summary_lines := [
  sprintf("Total GCP Backup Vault detected: %d", [count(resources)]),
  sprintf("Non-compliant GCP Backup Vault: %d/%d", [count(non_compliant), count(resources)])
]

violation_lines := [
  sprintf("GCP Backup Vault with invalid ID: '%s'", [r.values[attribute_path]]) |
  r := non_compliant[_]
]

summary := {
  "message": array.concat(summary_lines, violation_lines)
}

debug_non_compliant_ids := [r.values[attribute_path] |
  r := non_compliant[_]
]
