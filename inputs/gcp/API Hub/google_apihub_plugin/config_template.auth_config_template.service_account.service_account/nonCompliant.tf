resource "google_apihub_plugin" "non_compliant_example_1"{
  location = "us-central1"
  display_name = "Test Plugin c"
  project  = "PDE"
  plugin_id = "non_compliant_example_1"
  plugin_category = "API_GATEWAY"
    actions_config {
    id = "sync-metadata-c"
    display_name = "Sync Metadata c"
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
      id = "enum-val2"
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
