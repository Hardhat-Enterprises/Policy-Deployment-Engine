package terraform.gcp.security.cloud_domains.google_clouddomains_registration.hsts_preload_enabled

import data.terraform.gcp.security.cloud_domains.google_clouddomains_registration.vars as vars

# Default to false
default hsts_preload_enabled := false

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
