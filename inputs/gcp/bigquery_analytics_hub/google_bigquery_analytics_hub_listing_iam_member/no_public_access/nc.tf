# Resource type: google_bigquery_analytics_hub_listing_iam_member
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_bigquery_analytics_hub_listing_iam_member" "nc" {
  location         = "australia-southeast1"
  data_exchange_id = "my_data_exchange"
  listing_id       = "my_listing"
  role             = "roles/viewer"
  member           = "allUsers"
}
