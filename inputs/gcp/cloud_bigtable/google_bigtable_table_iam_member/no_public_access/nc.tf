resource "google_bigtable_table_iam_member" "nc" {
  instance_name = "bt-instance-nc"
  table         = "tbl-nc"
  role          = "roles/bigtable.reader"
  member        = "allUsers"
}
