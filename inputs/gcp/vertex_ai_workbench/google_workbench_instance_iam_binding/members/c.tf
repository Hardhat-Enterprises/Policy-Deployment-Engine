resource "google_workbench_instance_iam_binding" "c1" {
  project  = "my-secure-project"
  location = "australia-southeast2-a"
  name     = "c1"
  role     = "roles/notebooks.viewer"
  members  = [
    "user:viewer@example.com",
  ]
}
