package terraform.gcp.security.cloud_buildv2.connection.installation_id

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_buildv2.connection.vars

attribute_path := "github_config, app_installation_id"

compliant_values := [0]

summary := helpers.get_summary(
	vars.resource_type,
	attribute_path,
	compliant_values,
	vars.friendly_resource_name,
)
