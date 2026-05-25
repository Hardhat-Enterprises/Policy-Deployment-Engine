data "google_iam_policy" "nc" {
  binding {
    role    = "roles/datacatalog.admin"
    members = ["user:security@example.com"]
  }
}

resource "google_data_catalog_policy_tag_iam_policy" "nc" {
  policy_tag  = "projects/gcp-project-12345/locations/australia-southeast1/taxonomies/approved_taxonomy/policyTags/approved_policy_tag"
  policy_data = data.google_iam_policy.nc.policy_data
}
