# BigQuery Analytics Hub Data Exchange resource
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_bigquery_analytics_hub_data_exchange" "nc" {
  provider         = google-beta
  location         = "us-central1"
  data_exchange_id = "nc"
  display_name     = "nc"
  description      = "Non-compliant exchange - location is not approved"
  discovery_type   = "DISCOVERY_TYPE_PRIVATE"
}

