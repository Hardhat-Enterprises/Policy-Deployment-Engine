resource "google_data_catalog_policy_tag_iam_member" "nc" {
  policy_tag = "projects/gcp-project-12345/locations/australia-southeast1/taxonomies/approved_taxonomy/policyTags/approved_policy_tag"
  role       = "roles/datacatalog.admin"
  member     = "user:security@example.com"
}
