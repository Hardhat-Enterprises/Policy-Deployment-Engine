package terraform.gcp.security.app_engine.runtime_restriction

import data.terraform.gcp.helpers
import data.terraform.gcp.security.app_engine.runtime_restriction.vars

attribute_path := "runtime"
compliant_values := [
  "python3.9",
  "nodejs18",
  "go11.9"
]

summary := helpers.get_summary(vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name)
