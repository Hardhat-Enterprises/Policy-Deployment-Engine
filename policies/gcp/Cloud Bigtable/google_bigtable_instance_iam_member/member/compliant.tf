resource "google_bigtable_instance_iam_member" "compliant_example_1" {
  project  = "PDE"
  instance = "compliant_example_1"
  role     = "roles/bigtable.user"
  member   = "serviceAccount:test-sa@test-project.iam.gserviceaccount.com"
}
