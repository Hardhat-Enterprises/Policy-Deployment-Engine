package terraform.gcp.security.cloud_domains.google_clouddomains_registration.restrict_dns_name_servers

import data.terraform.gcp.security.cloud_domains.google_clouddomains_registration.vars as vars

# List of authorized name servers (Google Cloud Domains defaults)
authorized_patterns := [".googledomains.com."]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
