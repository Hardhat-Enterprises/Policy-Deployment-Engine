resource "google_workbench_instance_iam_member" "nc" {
  project  = "my-secure-project"
  location = "australia-southeast2-a"
  name     = "nc"
  role     = "roles/owner"
  member   = "user:admin@example.com"
}
