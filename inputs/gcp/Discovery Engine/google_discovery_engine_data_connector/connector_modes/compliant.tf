# Describe your resource type here
# Data connector
# Data source

# Maybe change the data source to one of the valid formats, whatever that might be.

resource "google_discovery_engine_data_connector" "compliant_example_1" {
  project                      = "735927692082"
  location                     = "eu"
  collection_id                = "compliant_example_1"
  collection_display_name      = "tf-c-dataconnector"
  data_source                  = "c-datasource"
  params = {
  }
  refresh_interval             = "86400s"
  incremental_refresh_interval = "21600s"
  kms_key_name = "/project/keys/my-safe-key"
  static_ip_enabled           = true
    connector_modes = ["DATA_INGESTION"]
}
