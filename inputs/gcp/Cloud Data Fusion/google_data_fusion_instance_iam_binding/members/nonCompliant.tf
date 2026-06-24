resource "google_data_fusion_instance_iam_binding" "non_compliant_example_1" {
  project = "gcp-project-12345"
  region  = "australia-southeast1"
  name    = "non_compliant_example_1"
  role    = "roles/viewer"

  members = [
    "user:student1@deakin.edu.au",
    "allUsers"
  ]
}
