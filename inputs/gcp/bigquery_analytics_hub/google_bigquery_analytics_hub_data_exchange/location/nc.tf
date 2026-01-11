resource "google_bigquery_analytics_hub_data_exchange" "nc" {
  data_exchange_id = "nc_exchange"
  location         = "us-central1"
  display_name     = "Noncompliant Exchange"
  description      = "Noncompliant test data exchange"
}
