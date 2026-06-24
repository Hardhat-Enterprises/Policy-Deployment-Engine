resource "google_bigtable_instance_iam_binding" "nc_g0" {
  project  = "PDE"
  instance = "nc"
  role     = "roles/bigtable.admin"
  members = [
    "serviceAccount:test-sa@test-project.iam.gserviceaccount.com",
  ]
}

resource "google_bigtable_instance_iam_binding" "nc_g1" {
  project  = "PDE"
  instance = "nc"
  role     = "roles/owner"
  members = [
    "serviceAccount:test-sa@test-project.iam.gserviceaccount.com",
  ]
}
