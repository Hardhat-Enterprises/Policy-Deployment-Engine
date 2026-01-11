resource "google_bigquery_analytics_hub_data_exchange" "c" {
  data_exchange_id = "c_exchange"
  location         = "australia-southeast1"
  display_name     = "Compliant Exchange"
  description      = "Compliant test data exchange"
}
