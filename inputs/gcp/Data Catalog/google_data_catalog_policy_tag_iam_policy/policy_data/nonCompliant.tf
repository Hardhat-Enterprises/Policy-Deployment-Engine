data "google_iam_policy" "nc" {
  binding {
    role    = "roles/datacatalog.viewer"
    members = ["allUsers"]
  }
}

resource "google_data_catalog_policy_tag_iam_policy" "non_compliant_example_1" {
  policy_tag  = "projects/gcp-project-12345/locations/australia-southeast1/taxonomies/approved_taxonomy/policyTags/approved_policy_tag"
  policy_data = data.google_iam_policy.nc.policy_data
}

data "google_iam_policy" "nc2" {
  binding {
    role    = "roles/datacatalog.admin"
    members = ["user:security@example.com"]
  }
}

resource "google_data_catalog_policy_tag_iam_policy" "non_compliant_example_2" {
  policy_tag  = "projects/gcp-project-12345/locations/australia-southeast1/taxonomies/approved_taxonomy/policyTags/approved_policy_tag"
  policy_data = data.google_iam_policy.nc2.policy_data
}
