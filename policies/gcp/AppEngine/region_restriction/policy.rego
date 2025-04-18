package terraform.gcp.security.app_engine.service.region_restriction

import data.terraform.gcp.helpers
import data.terraform.gcp.security.app_engine.service.vars

attribute_path := "location_id"
compliant_values := ["australia-southeast2"]

summary := helpers.get_summary(vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name)
