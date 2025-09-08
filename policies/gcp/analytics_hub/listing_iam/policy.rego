package terraform.gcp.security.analytics_hub.listing_iam

# List of IAM resource types to check
listing_types := {
  "google_bigquery_analytics_hub_listing_iam_binding",
  "google_bigquery_analytics_hub_listing_iam_member",
  "google_bigquery_analytics_hub_listing_iam_policy",
}

# 1. Location must be "us"
deny contains res if {
  rc := input.resource_changes[_]
  rc.type in listing_types

  ex := rc.change.after
  ex.location != "us"

  res := {
    "msg": sprintf("resource %s: location must be 'us', found: %v", [rc.address, ex.location]),
    "resource": rc.type,
  }
}

# 2. Roles must not be too permissive (no owner/editor)
deny contains res if {
  rc := input.resource_changes[_]
  rc.type == "google_bigquery_analytics_hub_listing_iam_binding"

  ex := rc.change.after
  bad_roles := {"roles/owner", "roles/editor"}
  ex.role in bad_roles

  res := {
    "msg": sprintf("resource %s: role '%s' is too permissive", [rc.address, ex.role]),
    "resource": rc.type,
  }
}

# 3. Members must not include allUsers or allAuthenticatedUsers
deny contains res if {
  rc := input.resource_changes[_]
  rc.type == "google_bigquery_analytics_hub_listing_iam_binding"

  ex := rc.change.after
  m := ex.members[_]
  disallowed_members := {"allUsers", "allAuthenticatedUsers"}
  m in disallowed_members

  res := {
    "msg": sprintf("resource %s: IAM binding grants access to disallowed member '%s'", [rc.address, m]),
    "resource": rc.type,
  }
}