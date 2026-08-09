resource "google_discovery_engine_data_connector" "non_compliant_example_1" {
  project                     = "735927692082"
  location                    = "eu"
  collection_id               = "non_compliant_example_1"
  collection_display_name     = "tf-c-dataconnector"
  data_source                 = "nc-datasource"
  params                      = {}
  refresh_interval            = "86400s"
  incremental_refresh_interval = "21600s"
  kms_key_name                = "/project/keys/my-safe-key"
  static_ip_enabled           = true
  destination_configs {
    key = "url"

    destinations {
      host = "https://example.com"
      port = 8080
    }
  }
}