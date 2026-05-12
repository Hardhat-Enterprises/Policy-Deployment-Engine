data "google_iam_policy" "nc" {
  binding {
    role    = "roles/datacatalog.viewer"
    members = ["user:security@example.com"]
  }
}

resource "google_data_catalog_policy_tag_iam_policy" "nc" {
  policy_tag  = "projects/other-project-12345/locations/us-central1/taxonomies/other_taxonomy/policyTags/other_policy_tag"
  policy_data = data.google_iam_policy.nc.policy_data
}
