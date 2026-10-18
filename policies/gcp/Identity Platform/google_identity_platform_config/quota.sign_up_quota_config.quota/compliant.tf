resource "google_identity_platform_config" "compliant_example_1" {
  project = "fake-project"
  quota {
    sign_up_quota_config {
      quota          = 100
      start_time     = "2099-01-01T00:00:00Z"
      quota_duration = "3600s"
    }
  }
}
