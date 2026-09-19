resource "google_identity_platform_config" "compliant_example_1" {
  project = "fake-project"
  client {
    permissions {
      disabled_user_signup = true
    }
  }
}

