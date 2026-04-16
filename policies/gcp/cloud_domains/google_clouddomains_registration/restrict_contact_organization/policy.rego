package terraform.gcp.security.cloud_domains.google_clouddomains_registration.restrict_contact_organization

import data.terraform.gcp.security.cloud_domains.google_clouddomains_registration.vars as vars

allowed_org := "Example Corp"

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
