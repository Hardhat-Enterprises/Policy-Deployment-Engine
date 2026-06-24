resource "google_bigtable_table_iam_binding" "nc" {
  instance_name = "bt-instance-nc"
  table         = "nc"
  role          = "roles/owner"
  members = [
    "serviceAccount:reader@pde-test-project.iam.gserviceaccount.com",
  ]
}
