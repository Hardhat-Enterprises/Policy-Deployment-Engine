resource "google_bigtable_table_iam_binding" "non_compliant_example_1" {
  instance_name = "bt-instance-nc"
  table         = "nc"
  role          = "roles/bigtable.admin"
  members = [
    "serviceAccount:reader@pde-test-project.iam.gserviceaccount.com",
  ]
}

resource "google_bigtable_table_iam_binding" "non_compliant_example_2" {
  instance_name = "bt-instance-nc"
  table         = "nc"
  role          = "roles/owner"
  members = [
    "serviceAccount:reader@pde-test-project.iam.gserviceaccount.com",
  ]
}
