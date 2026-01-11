resource "google_bigquery_analytics_hub_data_exchange" "nc" {
  provider         = google-beta
  data_exchange_id = "nc_exchange"
  location         = "australia-southeast1"
  display_name     = "Noncompliant Exchange"
  description      = "Noncompliant discovery type exchange"
  discovery_type   = "DISCOVERY_TYPE_PUBLIC"
}
