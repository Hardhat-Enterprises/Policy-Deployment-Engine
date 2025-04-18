package terraform.gcp.security.app_engine.no_default_service_account

import data.terraform.gcp.helpers
import data.terraform.gcp.security.app_engine.no_default_service_account.vars

attribute_path := "service_account"
compliant_values := [
  "my-service-account"
]

summary := helpers.get_summary(vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name)