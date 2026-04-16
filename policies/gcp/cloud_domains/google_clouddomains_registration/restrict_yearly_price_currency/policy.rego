package terraform.gcp.security.cloud_domains.google_clouddomains_registration.restrict_yearly_price_currency

import data.terraform.gcp.security.cloud_domains.google_clouddomains_registration.vars as vars

allowed_currency := "USD"

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
