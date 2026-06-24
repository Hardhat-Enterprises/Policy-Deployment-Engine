resource "google_data_catalog_entry_group_iam_member" "nc" {
  entry_group = "approved_entry_group"
  role        = "roles/datacatalog.admin"
  member      = "user:jane@example.com"
}