package terraform.gcp.security.cloud_buildv2.connection.disabled

import data.terraform.gcp.security.cloud_buildv2.connection.vars
import data.terraform.gcp.helpers
attribute_path := "disabled"

compliant_values := false

	summary := helpers.get_summary(
		vars.resource_type,
		attribute_path,
		compliant_values,
		vars.friendly_resource_name,
	)