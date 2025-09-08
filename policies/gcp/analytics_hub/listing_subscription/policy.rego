package terraform.gcp.security.analytics_hub.listing_subscription

# Deny if subscription_id is invalid
deny[res] {
  rc := input.resource_changes[_]
  rc.type == "google_bigquery_analytics_hub_listing_subscription"

  ex := rc.change.after
  not regex.match("^[a-z0-9_]+$", ex.subscription_id)

  res := {
    "msg": sprintf("resource %s: subscription_id '%s' must be lowercase alphanumeric with underscores", [rc.address, ex.subscription_id]),
    "resource": rc.type,
  }
}

# Deny if location is not US
deny[res] {
  rc := input.resource_changes[_]
  rc.type == "google_bigquery_analytics_hub_listing_subscription"

  ex := rc.change.after
  ex.location != "US"

  res := {
    "msg": sprintf("resource %s: location must be 'US', found: %v", [rc.address, ex.location]),
    "resource": rc.type,
  }
}
