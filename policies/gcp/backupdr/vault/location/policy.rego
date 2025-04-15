package terraform.gcp.security.backupdr.vault.location

import data.terraform.gcp.helpers
import data.terraform.gcp.security.backupdr.vault.vars

attribute_path := "location"

compliant_values := [
  "australia-southeast1",
  "AU"
]

summary := helpers.get_summary(vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name)
