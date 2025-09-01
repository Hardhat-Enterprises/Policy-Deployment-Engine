package terraform.gcp.analytics_hub.data_exchange_listing.naming_standard

import data.terraform.gcp.helpers
import data.terraform.gcp.analytics_hub.data_exchange_listing.vars

# Collect all violations as an ARRAY of objects
deny := [r |
  rc := input.resource_changes[_]
  rc.type == "google_bigquery_analytics_hub_listing"
  ex := rc.change.after
  not helpers.name_starts_with(ex.display_name, vars.prefix)
  r := {
    "msg": sprintf(
      "resource %s: Listing name '%s' must start with prefix '%s'",
      [rc.address, ex.display_name, vars.prefix]
    ),
    "resource": rc.type,
  }
]
