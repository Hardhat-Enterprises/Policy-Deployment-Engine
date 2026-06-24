data "google_iam_policy" "nc" {
  binding {
    role    = "roles/datacatalog.viewer"
    members = ["allUsers"]
  }
}

resource "google_data_catalog_entry_group_iam_policy" "nc" {
  entry_group = "approved_entry_group"
  policy_data = data.google_iam_policy.nc.policy_data
}
