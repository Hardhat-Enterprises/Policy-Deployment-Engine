resource "google_bigtable_instance_iam_binding" "c_g0" {
  project  = "PDE"
  instance = "c"
  role     = "roles/bigtable.reader"
  members = [
    "serviceAccount:test-sa@test-project.iam.gserviceaccount.com",
  ]
}

resource "google_bigtable_instance_iam_binding" "c_g1" {
  project  = "PDE"
  instance = "c"
  role     = "roles/bigtable.viewer"
  members = [
    "serviceAccount:test-sa@test-project.iam.gserviceaccount.com",
  ]
}
