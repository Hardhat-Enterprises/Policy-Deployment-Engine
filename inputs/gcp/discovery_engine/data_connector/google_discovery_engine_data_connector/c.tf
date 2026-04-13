# Describe your resource type here
# Data connector
# Data source

resource "google_discovery_engine_data_connector" "c" {
  collection_id           = "c"
  project                 = "735927692082"
  location                = "eu"
  collection_display_name = "tf-c-dataconnector"
  data_source             = "servicenow"
  params = {
    auth_type         = "OAUTH_PASSWORD_GRANT"
    instance_uri      = "https://gcpconnector1.service-now.com/"
    client_id         = "VALID-ID"
    client_secret     = "SECRET"
    static_ip_enabled = "false"
    user_account      = "Validuser@google.com"
    password          = "PASSWORD"
  }
  refresh_interval             = "86400s"
  incremental_refresh_interval = "21600s"
}