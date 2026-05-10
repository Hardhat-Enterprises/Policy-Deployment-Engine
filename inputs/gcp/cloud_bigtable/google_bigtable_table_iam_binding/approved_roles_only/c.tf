resource "google_bigtable_table_iam_binding" "c" {
  instance_name = "bt-instance-c"
  table         = "c"
  role          = "roles/bigtable.user"
  members = [
    "serviceAccount:reader@pde-test-project.iam.gserviceaccount.com",
  ]
}
