package terraform.gcp.security.backupdr.vault.retention

attribute_path := "backup_minimum_enforced_retention_duration"
compliant_values := ["86400s"]

resources := [r |
  some i
  r := input.planned_values.root_module.resources[i]
  r.type == "google_backup_dr_backup_vault"
]

non_compliant := [r |
  some i
  r := resources[i]
  not is_compliant(r.values[attribute_path])
]

is_compliant(val) if {
  val == "86400s"
}

summary_lines := [
  sprintf("Total GCP Backup Vaults found: %d", [count(resources)]),
  sprintf("Non-compliant GCP Backup Vaults: %d/%d", [count(non_compliant), count(resources)])
]

violation_lines := [
  sprintf(
    "GCP Backup Vault '%s' uses unapproved %s: '%s'",
    [r.values["name"], replace(attribute_path, "_", " "), r.values[attribute_path]]
  ) |
  some i
  r := non_compliant[i]
]

summary := {
  "message": array.concat(summary_lines, violation_lines)
}
