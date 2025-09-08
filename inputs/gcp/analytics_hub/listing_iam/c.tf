data "google_iam_policy" "viewer" {
  binding {
    role = "roles/viewer"
    members = [
      "user:jane@example.com",
      "serviceAccount:analytics-sa@my-project.iam.gserviceaccount.com",
    ]
  }
}

resource "google_bigquery_analytics_hub_listing_iam_policy" "c" {
  project          = "my-project"
  location         = "us"
  data_exchange_id = "valid_exchange"
  listing_id       = "valid_listing"
  policy_data      = data.google_iam_policy.viewer.policy_data
}
