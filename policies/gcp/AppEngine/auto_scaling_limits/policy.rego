package terraform.gcp.security.app_engine.auto_scaling_limits

import data.terraform.gcp.helpers
import data.terraform.gcp.security.app_engine.auto_scaling_limits.vars

attribute_path := "automatic_scaling.max_total_instances"
compliant_values := [
  10, 20, 50
]

summary := helpers.get_summary(vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name)
