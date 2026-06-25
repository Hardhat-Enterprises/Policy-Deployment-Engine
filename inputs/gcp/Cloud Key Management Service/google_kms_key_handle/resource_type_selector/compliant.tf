resource "google_kms_key_handle" "compliant_example_1" {
  project                = "google_project.resource_project.project_id"
  name                   = "compliant_example_1"
  location               = "australia-east1"
  resource_type_selector = "storage.googleapis.com/Bucket"
}
