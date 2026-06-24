resource "google_data_fusion_instance_iam_binding" "non_compliant_example_1" {
  project = "external-project-100"
  region  = "australia-southeast1"
  name    = "non_compliant_example_1"
  role    = "roles/viewer"

  members = ["user:student@deakin.edu.au"]
}
