resource "google_kms_key_handle" "nc1" {
  provider               = google-beta
  project                = "google_project.resource_project.project_id"
  name                   = "nc1"
  location               = "europe-east1"
  resource_type_selector = "storage.googleapis.com/Disk"

}

resource "google_kms_key_handle" "nc2" {
  provider               = google-beta
  project                = "google_project.resource_project.project_id"
  name                   = "nc2"
  location               = "europe-east1"
  resource_type_selector = "sqladmin.googleapis.com/Instance"

}