# BigQuery Analytics Hub Data Exchange resource
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_bigquery_analytics_hub_data_exchange" "compliant_example_1" {
  location         = "australia-southeast1"
  data_exchange_id = "compliant_example_1"
  display_name     = "c"
  description      = "Compliant exchange - discovery_type is approved"

  discovery_type = "DISCOVERY_TYPE_PRIVATE"
}
