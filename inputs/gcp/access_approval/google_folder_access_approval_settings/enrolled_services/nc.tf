resource "google_folder" "nc" {
  display_name        = "my-folder"
  parent              = "organizations/123456789"
  deletion_protection = false
}

resource "google_folder_access_approval_settings" "nc_folder_access_approval" {
  folder_id = google_folder.nc.folder_id

  enrolled_services {
    cloud_product = "none"
  }
}
