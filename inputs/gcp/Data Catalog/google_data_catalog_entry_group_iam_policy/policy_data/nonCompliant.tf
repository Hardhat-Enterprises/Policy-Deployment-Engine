data "google_iam_policy" "nc1" {
  binding {
    role    = "roles/datacatalog.viewer"
    members = ["allUsers"]
  }
}

resource "google_data_catalog_entry_group_iam_policy" "non_compliant_example_1" {
  entry_group = "approved_entry_group"
  policy_data = data.google_iam_policy.nc1.policy_data
}

data "google_iam_policy" "nc2" {
  binding {
    role    = "roles/datacatalog.admin"
    members = ["user:security@example.com"]
  }
}

resource "google_data_catalog_entry_group_iam_policy" "non_compliant_example_2" {
  entry_group = "approved_entry_group"
  policy_data = data.google_iam_policy.nc2.policy_data
}
