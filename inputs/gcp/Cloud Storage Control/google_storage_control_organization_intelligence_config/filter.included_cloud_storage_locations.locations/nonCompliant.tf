resource "google_storage_control_organization_intelligence_config" "non_compliant_example_1" {
  name           = "non_compliant_example_1"
  edition_config = "STANDARD"
  filter {
    included_cloud_storage_locations {
      locations = ["us-central1", "europe-west1"]
    }
  }
}
