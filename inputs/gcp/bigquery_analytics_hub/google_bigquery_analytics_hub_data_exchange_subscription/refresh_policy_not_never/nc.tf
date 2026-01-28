# BigQuery Analytics Hub Data Exchange Subscription (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_bigquery_analytics_hub_data_exchange_subscription" "nc" {
  provider = google-beta

  project  = "pde-test-project"
  location = "australia-southeast1"

  data_exchange_project  = "pde-test-project"
  data_exchange_location = "australia-southeast1"
  data_exchange_id       = "nc"

  subscription_id = "sub_bad"

  # Non-compliant
  refresh_policy = "NEVER"
}
