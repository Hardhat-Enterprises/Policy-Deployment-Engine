package terraform.gcp.security.cloud_buildv2.repository.annotations

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_buildv2.repository.vars

attribute_path := "annotations"

compliant_values := ["environment"]

summary := helpers.get_summary(
	vars.resource_type,
	attribute_path,
	compliant_values,
	vars.friendly_resource_name,
)
