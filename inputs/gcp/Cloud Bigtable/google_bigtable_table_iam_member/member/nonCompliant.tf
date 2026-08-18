resource "google_bigtable_table_iam_member" "non_compliant_example_1" {
  instance_name = "bt-instance-nc"
  table         = "tbl-nc"
  role          = "roles/bigtable.reader"
  member        = "allUsers"
}
