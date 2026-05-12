resource "google_data_catalog_entry_group_iam_member" "nc" {
  entry_group = "unapproved_entry_group"
  role        = "roles/viewer"
  member      = "user:jane@example.com"
}