# Describe your resource type here
# Data connector
# Data source

# Maybe change the data source to one of the valid formats, whatever that might be.

resource "google_discovery_engine_data_connector" "compliant_example_1" {

  bap_config {
    enabled_actions = [
      "create_issue"
    ]
  }

}
