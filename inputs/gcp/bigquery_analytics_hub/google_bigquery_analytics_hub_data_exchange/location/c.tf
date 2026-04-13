# BigQuery Analytics Hub Data Exchange resource
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_bigquery_analytics_hub_data_exchange" "c" {
  provider         = google-beta
  location         = "australia-southeast1"
  data_exchange_id = "c"
  display_name     = "c"
  description      = "Compliant exchange - location is approved"
  discovery_type   = "DISCOVERY_TYPE_PRIVATE"
}
