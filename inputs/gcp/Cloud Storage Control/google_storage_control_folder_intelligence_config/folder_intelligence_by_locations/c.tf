resource "google_storage_control_folder_intelligence_config" "c" {
  name           = "c"
  edition_config = "STANDARD"
  filter {
    included_cloud_storage_locations {
      locations = ["australia-southeast1", "australia-southeast2"]
    }
  }
}