resource "google_bigquery_analytics_hub_listing_iam_binding" "compliant_binding" {
  project          = "my-project"
  location         = "us"
  data_exchange_id = "exchange"
  listing_id       = "c"         # <- use listing_id for compliance marker
  role             = "roles/viewer"

  members = [
    "user:alice@example.com",
  ]
}