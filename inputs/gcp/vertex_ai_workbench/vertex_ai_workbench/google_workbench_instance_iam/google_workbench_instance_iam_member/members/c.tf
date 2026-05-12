resource "google_workbench_instance_iam_member" "c1" {
  project  = "my-secure-project"
  location = "australia-southeast2-a"
  name     = "c1"
  role     = "roles/notebooks.viewer"
  member   = "user:viewer@example.com"
}
