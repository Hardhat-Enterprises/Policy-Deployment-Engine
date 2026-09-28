resource "google_identity_platform_config" "compliant_example_1" {
  project                    = "fake-project"
  autodelete_anonymous_users = true
}

