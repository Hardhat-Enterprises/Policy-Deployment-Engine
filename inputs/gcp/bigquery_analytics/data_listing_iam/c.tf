resource "google_bigquery_analytics_hub_listing_iam_binding" "compliant_binding" {
  project         = "my-project"
  location        = "us"
  data_exchange_id = "compliant_exchange"
  listing_id      = "compliant_listing"
  role            = "roles/viewer"

  members = [
    "user:alice@example.com",
    "serviceAccount:my-sa@appspot.gserviceaccount.com",
  ]
}
