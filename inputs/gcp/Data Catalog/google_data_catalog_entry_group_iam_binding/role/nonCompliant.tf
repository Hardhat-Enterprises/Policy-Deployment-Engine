resource "google_data_catalog_entry_group_iam_binding" "non_compliant_example_1" {
  entry_group = "approved_entry_group"
  role        = "roles/datacatalog.admin"
  members     = ["user:security@example.com"]
}
