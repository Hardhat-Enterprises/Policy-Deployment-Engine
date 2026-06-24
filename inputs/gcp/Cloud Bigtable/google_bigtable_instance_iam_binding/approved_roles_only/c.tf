resource "google_bigtable_instance_iam_binding" "c" {
  project  = "PDE"
  instance = "c"
  role     = "roles/bigtable.reader"
  members = [
    "serviceAccount:test-sa@test-project.iam.gserviceaccount.com",
  ]
}
