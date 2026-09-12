resource "google_identity_platform_config" "compliant_example_1" {
  project = "fake-project"
  mfa {
    provider_configs {
      state = "MANDATORY"
      totp_provider_config {
        adjacent_intervals = 1
      }
    }
  }
}
