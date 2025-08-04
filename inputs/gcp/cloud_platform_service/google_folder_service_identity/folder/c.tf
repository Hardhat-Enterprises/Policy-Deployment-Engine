resource "google_folder" "my_folder" {
  parent = "organizations/1234567"
  display_name = "my-folder"
}

resource "google_folder_service_identity" "osconfig_sa" {
  provider = google-beta
  folder = google_folder.my_folder.folder_id
  service = "osconfig.googleapis.com"
}


resource "google_folder_iam_member" "admin" {
  folder = google_folder.my_folder.name
  role   = "roles/osconfig.serviceAgent"
  member = google_folder_service_identity.osconfig_sa.member
}