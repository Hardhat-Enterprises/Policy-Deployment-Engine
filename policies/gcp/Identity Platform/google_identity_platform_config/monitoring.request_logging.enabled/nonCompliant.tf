resource "google_identity_platform_config" "non_compliant_example_1" {
  project = "fake-project"
  monitoring {
    request_logging {
      enabled = false
    }
  }
}

