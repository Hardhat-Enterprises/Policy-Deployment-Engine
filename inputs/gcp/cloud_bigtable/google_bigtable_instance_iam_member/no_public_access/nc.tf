resource "google_bigtable_instance_iam_member" "nc" {
  project  = "PDE"
  instance = "nc"
  role     = "roles/bigtable.user"
  member   = "allUsers"
}
