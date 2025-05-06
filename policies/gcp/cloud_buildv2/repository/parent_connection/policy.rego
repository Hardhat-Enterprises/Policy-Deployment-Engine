package terraform.gcp.security.cloud_buildv2.repository.parent_connection

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_buildv2.repository.vars

attribute_path := "parent_connection"

compliant_values := ["starts-with:projects/"]


	summary := helpers.get_summary(
		vars.resource_type,
		attribute_path,
		compliant_values,
		vars.friendly_resource_name,
	)
