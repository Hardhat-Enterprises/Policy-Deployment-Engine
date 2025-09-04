resource "google_apihub_plugin" "nc1"{
  location = "us-central2"
  display_name = "Test Plugin nc1"
  project  = "PDE"
  plugin_id = "plugin-full-nc1"
  plugin_category = "API_GATEWAY1"
    actions_config {
    id = "sync-metadata-c"
    display_name = "Sync Metadata nc1"
    description = "Syncs API metadata."
    trigger_mode = "API_HUB_SCHEDULE_TRIGGER"
  }
  config_template {
    auth_config_template {
      supported_auth_types = ["NO_AUTH", "USER_PASSWORD"]
            service_account {
        service_account = "test@developer.gserviceaccount.com"
      }
    }
    additional_config_template {
      id = "non-compliant-val"
      value_type = "STRING"
    }
  }
}