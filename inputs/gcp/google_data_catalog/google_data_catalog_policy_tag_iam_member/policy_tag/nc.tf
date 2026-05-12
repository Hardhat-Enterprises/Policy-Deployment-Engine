resource "google_data_catalog_policy_tag_iam_member" "nc" {
  policy_tag = "projects/other-project-12345/locations/us-central1/taxonomies/other_taxonomy/policyTags/other_policy_tag"
  role       = "roles/datacatalog.viewer"
  member     = "user:security@example.com"
}
