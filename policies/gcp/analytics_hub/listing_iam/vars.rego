package terraform.gcp.security.analytics_hub.listing_iam

variables := {
    "friendly_resource_name": "BigQuery Analytics Hub Listing IAM",
    "resource_type": "google_bigquery_analytics_hub_listing_iam_binding",
    "resource_value_name": "location",
    "allowed_locations": ["us"],
    "disallowed_roles": ["roles/owner", "roles/editor"],
    "disallowed_members": ["allUsers", "allAuthenticatedUsers"]
}
