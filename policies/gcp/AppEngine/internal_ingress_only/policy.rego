package terraform.gcp.security.app_engine.internal_ingress_only

import data.terraform.gcp.helpers
import data.terraform.gcp.security.app_engine.internal_ingress_only.vars

attribute_path := "ingress_traffic"
compliant_values := [
  "INGRESS_TRAFFIC_INTERNAL_ONLY"
]

summary := helpers.get_summary(vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name)
