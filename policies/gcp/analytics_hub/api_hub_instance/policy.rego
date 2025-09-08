package terraform.gcp.analytics_hub.data_exchange.naming_standard

# Deny if display_name does not start with required prefix
deny := [r | 
  rc := input.resource_changes[_]
  rc.type == "google_bigquery_analytics_hub_data_exchange"

  ex := rc.change.after
  not startswith(ex.display_name, "de-")

  r := {
    "msg": sprintf("resource %s: display_name '%s' must start with 'de-'", [rc.address, ex.display_name]),
    "resource": rc.type,
  }
]
