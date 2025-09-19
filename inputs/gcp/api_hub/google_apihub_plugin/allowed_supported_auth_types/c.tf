resource "google_apihub_plugin" "c"{
  location = "us-central1"
  display_name = "Test Plugin c"
  project  = "PDE"
  plugin_id = "c"
  plugin_category = "API_GATEWAY"
    actions_config {
    id = "sync-metadata"
    display_name = "Sync Metadata"
    description = "Syncs API metadata."
    trigger_mode = "API_HUB_SCHEDULE_TRIGGER"
  }
  config_template {
    auth_config_template {
      supported_auth_types = ["USER_PASSWORD"]
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

