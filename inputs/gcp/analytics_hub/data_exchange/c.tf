# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_bigquery_analytics_hub_data_exchange" "example" {
  data_exchange_id = "compliant_example"
  location         = "US"
  description      = "Compliant data exchange"
  display_name     = "Compliant Exchange"
}


