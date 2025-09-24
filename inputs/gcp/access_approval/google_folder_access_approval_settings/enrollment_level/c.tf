resource "google_folder" "c" {
  display_name        = "google_folder"
  parent              = "organizations/123456789"
  deletion_protection = false
}

resource "google_folder_access_approval_settings" "c" {
  folder_id = "c"

  enrolled_services {
    cloud_product    = "none"
    enrollment_level = "BLOCK_ALL"
  }
}
