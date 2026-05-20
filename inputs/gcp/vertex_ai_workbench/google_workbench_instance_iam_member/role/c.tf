resource "google_workbench_instance_iam_member" "c" {
  project  = "my-secure-project"
  location = "australia-southeast2-a"
  name     = "c"
  role     = "roles/notebooks.viewer"
  member   = "user:viewer@example.com"
}
