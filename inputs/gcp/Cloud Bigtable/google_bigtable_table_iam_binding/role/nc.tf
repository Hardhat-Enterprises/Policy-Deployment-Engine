resource "google_bigtable_table_iam_binding" "nc_g0" {
  instance_name = "bt-instance-nc"
  table         = "nc"
  role          = "roles/bigtable.admin"
  members = [
    "serviceAccount:reader@pde-test-project.iam.gserviceaccount.com",
  ]
}

resource "google_bigtable_table_iam_binding" "nc_g1" {
  instance_name = "bt-instance-nc"
  table         = "nc"
  role          = "roles/owner"
  members = [
    "serviceAccount:reader@pde-test-project.iam.gserviceaccount.com",
  ]
}
