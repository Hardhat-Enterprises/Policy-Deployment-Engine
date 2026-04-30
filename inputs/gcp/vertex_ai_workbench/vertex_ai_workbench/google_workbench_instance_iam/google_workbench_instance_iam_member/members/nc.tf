resource "google_workbench_instance_iam_member" "nc1" {
  project  = "my-secure-project"
  location = "australia-southeast2-a"
  name     = "workbench-instance"
  role     = "roles/notebooks.viewer"
  member   = "allUsers"
}
