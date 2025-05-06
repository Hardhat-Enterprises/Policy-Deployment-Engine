package terraform.gcp.security.cloud_buildv2.repository.remote_uri

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_buildv2.repository.vars

attribute_path := "remote_uri"

compliant_values := ["https://"]


	summary := helpers.get_summary(
		vars.resource_type,
		attribute_path,
		compliant_values,
		vars.friendly_resource_name,
	)

