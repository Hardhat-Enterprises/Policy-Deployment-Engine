resource "google_storage_control_folder_intelligence_config" "compliant_example_1" {
  name           = "compliant_example_1"
  edition_config = "STANDARD"
  filter {
    included_cloud_storage_locations {
      locations = ["australia-southeast1", "australia-southeast2"]
    }
  }
}
