resource "google_apihub_plugin_instance" "nc1" {
  project = "PDE"
  location         = "us-central1"
  plugin           = "existing-plugin-id-nc1"
  plugin_instance_id = "nc1"
  display_name = "Sample Plugin Instance nc1"
  disable      = false
  actions {
    action_id = "existing-action-id-nc1"
  }
  auth_config {
    auth_type = "AUTH_TYPE_UNSPECIFIED"
  }
}

resource "google_apihub_plugin_instance" "nc2" {
  project = "PDE"
  location         = "us-central1"
  plugin           = "existing-plugin-id-nc2"
  plugin_instance_id = "nc2"
  display_name = "Sample Plugin Instance nc2"
  disable      = false
  actions {
    action_id = "existing-action-id-nc2"
  }
  auth_config {
    auth_type = "NO_AUTH GOOGLE_SERVICE_ACCOUNT"
  }
}