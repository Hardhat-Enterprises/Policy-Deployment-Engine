resource "google_apihub_plugin_instance" "c1" {
  project = "PDE"
  location = "us-central1"
  plugin = "existing-plugin-id-c1"
  plugin_instance_id = "c1"
  display_name = "Sample Plugin Instance c1"
  disable = false
  actions {
    action_id = "existing-action-id-c1"
  }
  auth_config {
    auth_type = "USER_PASSWORD"
  }
}

resource "google_apihub_plugin_instance" "c2" {
  project = "PDE"
  location = "us-central1"
  plugin = "existing-plugin-id-c2"
  plugin_instance_id = "c2"
  display_name = "Sample Plugin Instance c2"
  disable = false
  actions {
    action_id = "existing-action-id-c2"
  }
  auth_config {
    auth_type = "OAUTH2_CLIENT_CREDENTIALS"
  }
}

