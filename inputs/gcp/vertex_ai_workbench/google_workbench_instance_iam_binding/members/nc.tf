resource "google_workbench_instance_iam_binding" "nc" {
  project  = "my-secure-project"
  location = "australia-southeast2-a"
  name     = "nc"
  role     = "roles/notebooks.viewer"
  members  = [
    "allUsers",
  ]
}
