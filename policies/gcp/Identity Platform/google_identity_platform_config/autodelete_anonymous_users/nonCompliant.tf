resource "google_identity_platform_config" "non_compliant_example_1" {
  project                    = "fake-project"
  autodelete_anonymous_users = false
}

