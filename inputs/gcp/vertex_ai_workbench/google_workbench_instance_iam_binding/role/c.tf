resource "google_workbench_instance_iam_binding" "c" {
  project  = "my-secure-project"
  location = "australia-southeast2-a"
  name     = "c"
  role     = "roles/notebooks.viewer"
  members  = [
    "user:viewer@example.com",
  ]
}
