resource "google_kms_key_handle" "nc1" {
  provider               = google-beta
  project                = "google_project.resource_project.project_id"
  name                   = "non-compliant"
  location               = "europe-east1"
  resource_type_selector = "storage.googleapis.com/Bucket"
  
}