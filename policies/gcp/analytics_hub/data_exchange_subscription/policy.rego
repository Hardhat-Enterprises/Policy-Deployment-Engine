package terraform.gcp.analytics_hub.data_exchange_subscription.naming_standard

# Collect violations as an array of objects
deny := [r |
  rc := input.resource_changes[_]
  rc.type == "google_bigquery_analytics_hub_data_exchange_subscription"
  ex := rc.change.after

  # subscription_id must be lowercase alphanumeric with underscores
  not regex.match("^[a-z0-9_]+$", ex.subscription_id)

  r := {
    "msg": sprintf("resource %s: subscription_id '%s' must be lowercase alphanumeric with underscores", [rc.address, ex.subscription_id]),
    "resource": rc.type,
  }
]
