resource "google_workbench_instance_iam_member" "non_compliant_example_1" {
  project  = "my-secure-project"
  location = "australia-southeast2-a"
  name     = "non_compliant_example_1"
  role     = "roles/owner"
  member   = "user:viewer@example.com"
}
