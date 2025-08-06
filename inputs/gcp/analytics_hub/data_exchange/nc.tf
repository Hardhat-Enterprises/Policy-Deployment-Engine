resource "google_bigquery_analytics_hub_data_exchange" "nc" {
  data_exchange_id = "bad_example"
  location         = "US"
  description      = "Bad example without proper naming convention"
  display_name     = "Invalid Name"  # Use this to test against your Rego policy
}
