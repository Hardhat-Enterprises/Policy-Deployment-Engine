# Resource type: google_bigtable_table_iam_member
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_bigtable_table_iam_member" "c" {
  instance_name = "bt-instance-c"
  table         = "tbl-c"
  role          = "roles/bigtable.reader"
  member        = "serviceAccount:reader@pde-test-project.iam.gserviceaccount.com"
}
