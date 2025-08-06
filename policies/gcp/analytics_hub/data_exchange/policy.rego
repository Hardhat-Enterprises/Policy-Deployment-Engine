package terraform.gcp.analytics_hub.data_exchange.naming_standard

import data.terraform.gcp.helpers
import data.terraform.gcp.analytics_hub.data_exchange.vars

deny[{
  "msg": msg,
  "resource": resource_type
}] if {
  input.resource_type == "google_bigquery_analytics_hub_data_exchange"
  exchange := input.change.after
  not helpers.name_starts_with(exchange.name, vars.prefix)
  msg := sprintf("Data Exchange name '%s' must start with prefix '%s'", [exchange.name, vars.prefix])
  resource_type := input.resource_type
}
