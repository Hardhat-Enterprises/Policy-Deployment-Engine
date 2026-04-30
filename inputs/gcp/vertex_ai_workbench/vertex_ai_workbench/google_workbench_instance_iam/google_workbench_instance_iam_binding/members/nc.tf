resource "google_workbench_instance_iam_binding" "nc1" {
  project  = "my-secure-project"
  location = "australia-southeast2-a"
  name     = "workbench-instance"
  role     = "roles/notebooks.viewer"
  members  = [
    "allUsers",
  ]
}
