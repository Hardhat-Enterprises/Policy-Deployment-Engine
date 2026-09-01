resource "google_identity_platform_config" "non_compliant_example_1" {
  project = "fake-project"
  sms_region_config {
    allowlist_only {
      allowed_regions = ["USA"]
    }
  }
}
