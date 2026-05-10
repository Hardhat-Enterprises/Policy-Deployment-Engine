resource "google_bigtable_instance_iam_binding" "c" {
  project  = "PDE"
  instance = "c"
  role     = "roles/bigtable.viewer"
  members = [
    "serviceAccount:test-sa@test-project.iam.gserviceaccount.com",
  ]
}
