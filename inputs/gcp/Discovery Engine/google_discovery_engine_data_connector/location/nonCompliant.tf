# Describe your resource type here
# Data connector
# Location

resource "google_discovery_engine_data_connector" "non_compliant_example_1" {
  project                      = "735927692082"
  location                     = "us"
  collection_id                = "non_compliant_example_1"
  collection_display_name      = "tf-c-dataconnector"
  data_source                  = "nc-datasource"
  params = {
  }
  refresh_interval             = "86400s"
  incremental_refresh_interval = "21600s"
}
