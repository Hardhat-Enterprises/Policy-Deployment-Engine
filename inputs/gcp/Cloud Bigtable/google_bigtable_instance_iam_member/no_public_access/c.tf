resource "google_bigtable_instance_iam_member" "c" {
  project  = "PDE"
  instance = "c"
  role     = "roles/bigtable.user"
  member   = "serviceAccount:test-sa@test-project.iam.gserviceaccount.com"
}
