resource "google_kms_key_handle" "c1" {
  provider               = google-beta
  project                = "google_project.resource_project.project_id"
  name                   = "c1"
  location               = "australia-east1"
  resource_type_selector = "storage.googleapis.com/Bucket"
}