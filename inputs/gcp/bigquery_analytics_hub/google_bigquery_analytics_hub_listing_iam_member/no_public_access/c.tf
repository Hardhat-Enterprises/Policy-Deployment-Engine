# Resource type: google_bigquery_analytics_hub_listing_iam_member
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_bigquery_analytics_hub_listing_iam_member" "c" {
  location         = "australia-southeast1"
  data_exchange_id = "c"
  listing_id       = "c"
  role             = "roles/viewer"
  member           = "user:jane@example.com"
}
