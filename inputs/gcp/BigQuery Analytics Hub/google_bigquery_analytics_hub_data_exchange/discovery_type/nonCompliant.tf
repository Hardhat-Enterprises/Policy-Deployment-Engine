# BigQuery Analytics Hub Data Exchange resource
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_bigquery_analytics_hub_data_exchange" "non_compliant_example_1" {
  location         = "australia-southeast1"
  data_exchange_id = "non_compliant_example_1"
  display_name     = "nc"
  description      = "Non-compliant exchange - discovery_type is not approved"

  discovery_type = "DISCOVERY_TYPE_PUBLIC"
}
