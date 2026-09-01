resource "google_kms_key_handle" "non_compliant_example_1" {
  project                = "google_project.resource_project.project_id"
  name                   = "non_compliant_example_1"
  location               = "australia-east1"
  resource_type_selector = "storage.googleapis.com/Disk"

}

resource "google_kms_key_handle" "non_compliant_example_2" {
  project                = "google_project.resource_project.project_id"
  name                   = "non_compliant_example_2"
  location               = "australia-east1"
  resource_type_selector = "sqladmin.googleapis.com/Instance"

}
