resource "google_folder" "nc" {
  display_name        = "my-folder"
  parent              = "organizations/123456789"
  deletion_protection = false
}

resource "google_folder_access_approval_settings" "nc" {
  folder_id = "nc"

  enrolled_services {
    cloud_product = "none"
  }
}
