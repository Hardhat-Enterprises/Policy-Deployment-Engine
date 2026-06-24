# Resource type: google_bigquery_analytics_hub_listing_iam_member
# NON-COMPLIANT: allUsers always banned
resource "google_bigquery_analytics_hub_listing_iam_member" "non_compliant_example_1" {
  location         = "australia-southeast1"
  data_exchange_id = "nc1"
  listing_id       = "non_compliant_example_1"
  role             = "roles/viewer"
  member           = "allUsers"
}

# NON-COMPLIANT: allAuthenticatedUsers + high-priv role (should be blocked)
resource "google_bigquery_analytics_hub_listing_iam_member" "non_compliant_example_2" {
  location         = "australia-southeast1"
  data_exchange_id = "nc2"
  listing_id       = "non_compliant_example_2"
  role             = "roles/editor"
  member           = "allAuthenticatedUsers"
}

# COMPLIANT : allAuthenticatedUsers + low-priv role (should be allowed)
resource "google_bigquery_analytics_hub_listing_iam_member" "non_compliant_example_3" {
  location         = "australia-southeast1"
  data_exchange_id = "nc3"
  listing_id       = "non_compliant_example_3"
  role             = "roles/viewer"
  member           = "allAuthenticatedUsers"
}
