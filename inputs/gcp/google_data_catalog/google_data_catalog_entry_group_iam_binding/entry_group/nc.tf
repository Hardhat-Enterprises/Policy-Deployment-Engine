resource "google_data_catalog_entry_group_iam_binding" "nc" {
  entry_group = "unapproved_entry_group"
  role        = "roles/datacatalog.viewer"
  members     = ["user:security@example.com"]
}
