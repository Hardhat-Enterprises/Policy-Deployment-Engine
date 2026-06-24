resource "google_bigtable_instance_iam_binding" "non_compliant_example_1" {
  project  = "PDE"
  instance = "nc"
  role     = "roles/bigtable.admin"
  members = [
    "serviceAccount:test-sa@test-project.iam.gserviceaccount.com",
  ]
}

resource "google_bigtable_instance_iam_binding" "non_compliant_example_2" {
  project  = "PDE"
  instance = "nc"
  role     = "roles/owner"
  members = [
    "serviceAccount:test-sa@test-project.iam.gserviceaccount.com",
  ]
}
