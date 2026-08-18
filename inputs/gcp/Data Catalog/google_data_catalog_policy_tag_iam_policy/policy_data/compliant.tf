data "google_iam_policy" "c" {
  binding {
    role    = "roles/datacatalog.viewer"
    members = ["user:security@example.com"]
  }
}

resource "google_data_catalog_policy_tag_iam_policy" "compliant_example_1" {
  policy_tag  = "projects/gcp-project-12345/locations/australia-southeast1/taxonomies/approved_taxonomy/policyTags/approved_policy_tag"
  policy_data = data.google_iam_policy.c.policy_data
}

data "google_iam_policy" "c2" {
  binding {
    role    = "roles/datacatalog.viewer"
    members = ["user:security@example.com"]
  }
}

resource "google_data_catalog_policy_tag_iam_policy" "compliant_example_2" {
  policy_tag  = "projects/gcp-project-12345/locations/australia-southeast1/taxonomies/approved_taxonomy/policyTags/approved_policy_tag"
  policy_data = data.google_iam_policy.c2.policy_data
}
