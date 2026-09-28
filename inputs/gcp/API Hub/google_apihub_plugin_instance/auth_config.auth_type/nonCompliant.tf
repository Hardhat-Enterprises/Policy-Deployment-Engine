resource "google_apihub_plugin_instance" "non_compliant_example_1" {
  project = "PDE"
  location         = "us-central1"
  plugin = "existing-plugin-id-c1"
  plugin_instance_id = "non_compliant_example_1"
  display_name = "Sample Plugin Instance c1"
  disable      = false
  actions {
    action_id = "existing-action-id-c1"
  }
  auth_config {
    auth_type = "AUTH_TYPE_UNSPECIFIED"
  }
}

resource "google_apihub_plugin_instance" "non_compliant_example_2" {
  project = "PDE"
  location         = "us-central1"
  plugin = "existing-plugin-id-c2"
  plugin_instance_id = "non_compliant_example_2"
  display_name = "Sample Plugin Instance c2"
  disable      = false
  actions {
    action_id = "existing-action-id-c2"
  }
  auth_config {
    auth_type = "NO_AUTH GOOGLE_SERVICE_ACCOUNT"
  }
}
