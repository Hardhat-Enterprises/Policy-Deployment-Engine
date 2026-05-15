resource "google_workbench_instance_iam_member" "nc" {
  project  = "my-secure-project"
  location = "australia-southeast2-a"
  name     = "nc"
  role     = "roles/notebooks.viewer"
  member   = "allUsers"
}
