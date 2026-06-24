resource "google_bigtable_table_iam_binding" "c_g0" {
  instance_name = "bt-instance-c"
  table         = "c"
  role          = "roles/bigtable.user"
  members = [
    "serviceAccount:reader@pde-test-project.iam.gserviceaccount.com",
  ]
}

resource "google_bigtable_table_iam_binding" "c_g1" {
  instance_name = "bt-instance-c"
  table         = "c"
  role          = "roles/bigtable.viewer"
  members = [
    "serviceAccount:reader@pde-test-project.iam.gserviceaccount.com",
  ]
}
