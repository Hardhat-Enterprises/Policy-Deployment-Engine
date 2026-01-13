resource "google_bigquery_analytics_hub_data_exchange_subscription" "nc" {
  provider = google-beta

  project  = "pde-test-project"
  location = "australia-southeast1"

  data_exchange_project  = "pde-test-project"
  data_exchange_location = "australia-southeast1"
  data_exchange_id       = "nc_exchange"

  subscription_id    = "nc_subscription"
  subscriber_contact = "testuser@example.com"

  refresh_policy = "NEVER"
}
