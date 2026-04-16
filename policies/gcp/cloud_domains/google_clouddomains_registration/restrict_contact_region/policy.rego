package terraform.gcp.security.cloud_domains.google_clouddomains_registration.restrict_contact_region

import data.terraform.gcp.security.cloud_domains.google_clouddomains_registration.vars as vars

allowed_region := "AU"

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
