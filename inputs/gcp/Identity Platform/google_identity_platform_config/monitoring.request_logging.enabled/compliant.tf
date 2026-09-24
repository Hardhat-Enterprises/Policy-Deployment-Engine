resource "google_identity_platform_config" "compliant_example_1" {
  project = "fake-project"
  monitoring {
    request_logging {
      enabled = true
    }
  }
}

