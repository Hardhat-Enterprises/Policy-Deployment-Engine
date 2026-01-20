# BigQuery Analytics Hub Data Exchange resource
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_bigquery_analytics_hub_data_exchange" "nc" {
  provider         = google-beta
  location         = "australia-southeast1"
  data_exchange_id = "nc_data_exchange_discovery"
  display_name     = "nc_data_exchange_discovery"
  description      = "Non-compliant exchange - discovery_type is not approved"

  discovery_type = "DISCOVERY_TYPE_PUBLIC"
}
