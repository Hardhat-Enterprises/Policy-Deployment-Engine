package terraform.gcp.security.backupdr.vault.force_delete

attribute_path := "force_delete"
compliant_values := [true]

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
  val == true
}

summary_lines := [
  sprintf("Total GCP Backup Vaults found: %d", [count(resources)]),
  sprintf("Non-compliant GCP Backup Vaults: %d/%d", [count(non_compliant), count(resources)])
]

violation_lines := [
  sprintf(
    "GCP Backup Vault '%s' does not have '%s' set to true",
    [r.values["name"], attribute_path]
  ) |
  some i
  r := non_compliant[i]
]

summary := {
  "message": array.concat(summary_lines, violation_lines)
}
