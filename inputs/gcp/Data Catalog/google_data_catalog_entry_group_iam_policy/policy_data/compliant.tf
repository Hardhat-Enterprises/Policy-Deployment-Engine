data "google_iam_policy" "c" {
  binding {
    role    = "roles/datacatalog.viewer"
    members = ["user:security@example.com"]
  }
}

resource "google_data_catalog_entry_group_iam_policy" "compliant_example_1" {
  entry_group = "approved_entry_group"
  policy_data = data.google_iam_policy.c.policy_data
}

data "google_iam_policy" "c" {
  binding {
    role    = "roles/datacatalog.viewer"
    members = ["user:security@example.com"]
  }
}

resource "google_data_catalog_entry_group_iam_policy" "compliant_example_2" {
  entry_group = "approved_entry_group"
  policy_data = data.google_iam_policy.c.policy_data
}
