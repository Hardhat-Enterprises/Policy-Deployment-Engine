resource "google_bigtable_instance_iam_binding" "nc" {
  project  = "PDE"
  instance = "nc"
  role     = "roles/owner"
  members = [
    "serviceAccount:test-sa@test-project.iam.gserviceaccount.com",
  ]
}
