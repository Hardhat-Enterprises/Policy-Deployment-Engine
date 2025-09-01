resource "google_bigquery_analytics_hub_data_exchange_iam_binding" "binding" {
  project         = google_bigquery_analytics_hub_data_exchange.data_exchange.project
  location        = google_bigquery_analytics_hub_data_exchange.data_exchange.location
  data_exchange_id = google_bigquery_analytics_hub_data_exchange.data_exchange.data_exchange_id
  role             = "roles/viewer"
  members          = [
    "user:jane@example.com",
  ]
}
