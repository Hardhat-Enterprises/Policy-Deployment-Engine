package terraform.gcp.security.app_engine.vpc_connector_required

import data.terraform.gcp.helpers
import data.terraform.gcp.security.app_engine.vpc_connector_required.vars

attribute_path := "vpc_access_connector.name"
compliant_values := [
  "my-vpc-connector"
]

summary := helpers.get_summary(vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name)
