package terraform.gcp.security.backupdr.vault.ignore_inactive_datasources

import data.terraform.gcp.helpers
import data.terraform.gcp.security.backupdr.vault.vars

attribute_path := "ignore_inactive_datasources"

compliant_values := [
  true
]

summary := helpers.get_summary(vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name)
