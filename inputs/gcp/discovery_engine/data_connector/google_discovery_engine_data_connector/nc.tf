# Describe your resource type here
# Data connector
# Prams

resource "google_discovery_engine_data_connector" "nc" {
  collection_id                = "nc"
  project                      = "735927692082"
  location                     = "eu"
  collection_display_name      = "tf-c-dataconnector"
  data_source                  = "nc-datasource"
  params = {
    auth_type                  = "OAUTH_PASSWORD_GRANT"
    instance_uri               = "https://gcpconnector1.service-now.com/"
    client_id                  = "INVALID-ID"
    client_secret              = "SECRET"
    static_ip_enabled          = "true"
    user_account               = "InValiduser@google.com"
    password                   = "PASSWORD"
  }
  refresh_interval             = "86400s"
  incremental_refresh_interval = "21600s"
}