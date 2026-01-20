# BigQuery Analytics Hub Data Exchange resource
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_bigquery_analytics_hub_data_exchange" "c" {
  provider         = google-beta
  location         = "australia-southeast1"
  data_exchange_id = "c_data_exchange_discovery"
  display_name     = "c_data_exchange_discovery"
  description      = "Compliant exchange - discovery_type is approved"

  discovery_type = "DISCOVERY_TYPE_PRIVATE"
}
