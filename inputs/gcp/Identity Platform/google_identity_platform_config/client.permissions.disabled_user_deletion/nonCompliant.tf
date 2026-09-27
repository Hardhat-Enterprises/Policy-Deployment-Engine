resource "google_identity_platform_config" "non_compliant_example_1" {
  project = "fake-project"
  client {
    permissions {
      disabled_user_deletion = false
    }
  }
}

