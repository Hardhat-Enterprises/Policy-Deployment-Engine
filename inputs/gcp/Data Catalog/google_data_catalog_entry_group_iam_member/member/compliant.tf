resource "google_data_catalog_entry_group_iam_member" "compliant_example_1" {
  entry_group = "approved_entry_group"
  role        = "roles/viewer"
  member      = "user:jane@example.com"
}
