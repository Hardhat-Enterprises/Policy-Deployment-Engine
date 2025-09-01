package terraform.gcp.blockchain.data_exchange.iam

# Ensure resource names follow the naming convention
deny := [r |
  rc := input.resource_changes[_]
  rc.type == "google_bigquery_analytics_hub_data_exchange_iam_binding"
  not startswith(rc.change.after.data_exchange_id, "gcp-")
  r := {
    "msg": sprintf("resource %s: Data Exchange ID '%s' must start with 'gcp-'", [rc.address, rc.change.after.data_exchange_id]),
    "resource": rc.type,
  }
]
