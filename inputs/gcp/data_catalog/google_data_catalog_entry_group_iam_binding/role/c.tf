resource "google_data_catalog_entry_group_iam_binding" "c" {
  entry_group = "approved_entry_group"
  role        = "roles/datacatalog.viewer"
  members     = ["user:security@example.com"]
}
