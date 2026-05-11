resource "google_storage_control_folder_intelligence_config" "nc" {
  name           = "nc"
  edition_config = "STANDARD"
  filter {
    included_cloud_storage_locations {
      locations = ["us-central1", "europe-west1"]
    }
  }
}