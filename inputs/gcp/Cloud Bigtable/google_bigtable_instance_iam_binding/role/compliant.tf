resource "google_bigtable_instance_iam_binding" "compliant_example_1" {
  project  = "PDE"
  instance = "c"
  role     = "roles/bigtable.reader"
  members = [
    "serviceAccount:test-sa@test-project.iam.gserviceaccount.com",
  ]
}

resource "google_bigtable_instance_iam_binding" "compliant_example_2" {
  project  = "PDE"
  instance = "c"
  role     = "roles/bigtable.viewer"
  members = [
    "serviceAccount:test-sa@test-project.iam.gserviceaccount.com",
  ]
}
