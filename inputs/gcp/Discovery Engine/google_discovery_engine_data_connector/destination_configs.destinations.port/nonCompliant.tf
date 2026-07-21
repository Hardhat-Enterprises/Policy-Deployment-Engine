# Describe your resource type here
# Data connector
# Data source

resource "google_discovery_engine_data_connector" "non_compliant_example_1" {

  destination_configs {
    destinations {
      host = "https://evil.com"
    }
  }

}