resource "google_folder" "c" {
  display_name        = "my-folder"
  parent              = "organizations/123456789"
  deletion_protection = false
}

resource "google_folder_access_approval_settings" "c_folder_access_approval" {
  folder_id = google_folder.c.folder_id

  enrolled_services {
    cloud_product = "all"
  }
}
