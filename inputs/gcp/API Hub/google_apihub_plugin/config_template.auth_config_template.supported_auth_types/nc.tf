resource "google_apihub_plugin" "nc1"{
  location = "us-central1"
  display_name = "Test Plugin nc1"
  project  = "PDE"
  plugin_id = "nc1"
  plugin_category = "API_GATEWAY"
    actions_config {
    id = "sync-metadata"
    display_name = "Sync Metadata"
    description = "Syncs API metadata."
    trigger_mode = "API_HUB_SCHEDULE_TRIGGER"
  }
  config_template {
    auth_config_template {
      supported_auth_types = ["NO_AUTH"]
            service_account {
        service_account = "test@developer.gserviceaccount.com"
      }
    }
    additional_config_template {
      id = "enum-val"
      value_type = "ENUM"
      enum_options {
        id = "Option1"
        display_name = "Option1"
      }
      enum_options {
        id = "Option2"
        display_name = "Option2"
      }
    }
  }
}