package terraform.gcp.security.cloud_buildv2.connection.github_config

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_buildv2.connection.vars

attribute_path := "github_config"

compliant_values := ["defined"]

summary := helpers.get_summary(
	vars.resource_type,
	attribute_path,
	compliant_values,
	vars.friendly_resource_name,
)
