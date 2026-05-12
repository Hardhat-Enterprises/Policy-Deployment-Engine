resource "google_data_catalog_entry_group_iam_policy" "nc" {
  entry_group = "unapproved_entry_group"
  policy_data = jsonencode({
    bindings = [{
      role    = "roles/datacatalog.viewer"
      members = ["user:security@example.com"]
    }]
  })
}
