package terraform.gcp.security.cloud_buildv2.repository.location

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_buildv2.repository.vars

attribute_path := "location"

compliant_values := ["global"]


	summary := helpers.get_summary(
		vars.resource_type,
		attribute_path,
		compliant_values,
		vars.friendly_resource_name,
	)
