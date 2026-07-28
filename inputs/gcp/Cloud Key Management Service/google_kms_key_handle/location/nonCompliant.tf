resource "google_kms_key_handle" "non_compliant_example_1" {
  project                = "google_project.resource_project.project_id"
  name                   = "non_compliant_example_1"
  location               = "europe-east1"
  resource_type_selector = "storage.googleapis.com/Bucket"

}
