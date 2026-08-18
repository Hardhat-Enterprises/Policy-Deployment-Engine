resource "google_bigtable_instance_iam_member" "non_compliant_example_1" {
  project  = "PDE"
  instance = "non_compliant_example_1"
  role     = "roles/bigtable.user"
  member   = "allUsers"
}
