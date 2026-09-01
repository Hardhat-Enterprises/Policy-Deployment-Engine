resource "google_identity_platform_config" "non_compliant_example_1" {
  project = "fake-project"
  sms_region_config {
    allow_by_default {
      disallowed_regions = ["US"]
    }
  }
}

