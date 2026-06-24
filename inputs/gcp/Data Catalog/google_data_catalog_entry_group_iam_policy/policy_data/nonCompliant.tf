data "google_iam_policy" "nc" {
  binding {
    role    = "roles/datacatalog.viewer"
    members = ["allUsers"]
  }
}

resource "google_data_catalog_entry_group_iam_policy" "non_compliant_example_1" {
  entry_group = "approved_entry_group"
  policy_data = data.google_iam_policy.nc.policy_data
}

data "google_iam_policy" "nc" {
  binding {
    role    = "roles/datacatalog.admin"
    members = ["user:security@example.com"]
  }
}

resource "google_data_catalog_entry_group_iam_policy" "non_compliant_example_2" {
  entry_group = "approved_entry_group"
  policy_data = data.google_iam_policy.nc.policy_data
}
