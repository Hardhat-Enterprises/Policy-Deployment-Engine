# BigQuery Analytics Hub Data Exchange Subscription (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_bigquery_analytics_hub_data_exchange_subscription" "c" {
  provider = google-beta

  project  = "pde-test-project"
  location = "australia-southeast1"

  data_exchange_project  = "pde-test-project"
  data_exchange_location = "australia-southeast1"
  data_exchange_id       = "my_test_dataexchange"

  subscription_id = "sub_ok"

  # Compliant
  refresh_policy = "ON_READ"
}
