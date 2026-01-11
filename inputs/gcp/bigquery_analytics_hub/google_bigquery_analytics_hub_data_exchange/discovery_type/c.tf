resource "google_bigquery_analytics_hub_data_exchange" "c" {
  provider         = google-beta
  data_exchange_id = "c_exchange"
  location         = "australia-southeast1"
  display_name     = "Compliant Exchange"
  description      = "Compliant discovery type exchange"
  discovery_type   = "DISCOVERY_TYPE_PRIVATE"
}
