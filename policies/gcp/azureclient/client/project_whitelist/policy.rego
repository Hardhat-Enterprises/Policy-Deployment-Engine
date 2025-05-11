package terraform.gcp.security.azureclient.client.project_whitelist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.azureclient.client.vars

attribute_path := "project"

compliant_values := [
  "secure-project-1",
  "approved-project",
  "prod-project-xyz"
]

summary := helpers.get_summary(vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name)
