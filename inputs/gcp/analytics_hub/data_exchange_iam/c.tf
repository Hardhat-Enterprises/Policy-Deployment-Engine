data "google_iam_policy" "admin" {
  binding {
    role    = "roles/viewer"
    members = [
      "user:jane@example.com",  # Example user
    ]
  }
}

resource "google_bigquery_analytics_hub_data_exchange_iam_policy" "policy" {
  project         = google_bigquery_analytics_hub_data_exchange.data_exchange.project
  location        = google_bigquery_analytics_hub_data_exchange.data_exchange.location
  data_exchange_id = google_bigquery_analytics_hub_data_exchange.data_exchange.data_exchange_id
  policy_data      = data.google_iam_policy.admin.policy_data
}
