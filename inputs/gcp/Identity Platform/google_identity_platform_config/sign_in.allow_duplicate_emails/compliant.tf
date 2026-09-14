resource "google_identity_platform_config" "compliant_example_1" {
  project = "fake-project"
  sign_in {
    allow_duplicate_emails = false
  }
}

