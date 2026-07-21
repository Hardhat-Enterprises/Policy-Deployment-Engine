# Describe your resource type here
# Data connector
# Data source

resource "google_discovery_engine_data_connector" "non_compliant_example_1" {

  action_config {
    create_bap_connection = true
  }

}