# Describe your resource type here
# Data connector
# Json prams

resource "google_discovery_engine_data_connector" "c" {
  project                      = "735927692082"
  location                     = "eu"
  collection_id                = "c"
  collection_display_name      = "tf-c-dataconnector"
  data_source                  = "servicenow"
  json_params				   = "valid-string"
  refresh_interval             = "86400s"
  incremental_refresh_interval = "21600s"
}