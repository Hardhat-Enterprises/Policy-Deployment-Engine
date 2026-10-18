resource "google_workbench_instance_iam_binding" "non_compliant_example_1" {
  project  = "my-secure-project"
  location = "australia-southeast2-a"
  name     = "non_compliant_example_1"
  role     = "roles/notebooks.viewer"
  members  = [
    "allUsers",
  ]
}
