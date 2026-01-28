# Resource type: google_bigquery_analytics_hub_listing_iam_member
# NON-COMPLIANT: allUsers always banned
resource "google_bigquery_analytics_hub_listing_iam_member" "nc" {
  location         = "australia-southeast1"
  data_exchange_id = "nc"
  listing_id       = "nc"
  role             = "roles/viewer"
  member           = "allUsers"
}

# NON-COMPLIANT: allAuthenticatedUsers + high-priv role (should be blocked)
resource "google_bigquery_analytics_hub_listing_iam_member" "bad_auth" {
  location         = "australia-southeast1"
  data_exchange_id = "nc"
  listing_id       = "nc"
  role             = "roles/editor"
  member           = "allAuthenticatedUsers"
}

# COMPLIANT : allAuthenticatedUsers + low-priv role (should be allowed)
resource "google_bigquery_analytics_hub_listing_iam_member" "auth_viewer" {
  location         = "australia-southeast1"
  data_exchange_id = "nc"
  listing_id       = "nc"
  role             = "roles/viewer"
  member           = "allAuthenticatedUsers"
}
