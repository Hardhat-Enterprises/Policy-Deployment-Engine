resource "google_workbench_instance_iam_member" "nc1" {
  project  = "my-secure-project"
  location = "australia-southeast2-a"
  name     = "nc1"
  role     = "roles/owner"
  member   = "user:admin@example.com"
}
