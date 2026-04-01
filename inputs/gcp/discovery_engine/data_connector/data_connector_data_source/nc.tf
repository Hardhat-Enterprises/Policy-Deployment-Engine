# Describe your resource type here
# Data connector
# Data source

resource "google_discovery_engine_data_connector" "nc" {
  project                      = "735927692082"
  location                     = "eu"
  collection_id                = "nc"
  collection_display_name      = "tf-c-dataconnector"
  data_source                  = "nc-datasource"
  params = {
  }
  refresh_interval             = "86400s"
  incremental_refresh_interval = "21600s"
}