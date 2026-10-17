resource "google_data_catalog_policy_tag_iam_binding" "compliant_example_1" {
  policy_tag = "projects/gcp-project-12345/locations/australia-southeast1/taxonomies/approved_taxonomy/policyTags/approved_policy_tag"
  role       = "roles/datacatalog.viewer"
  members    = ["user:security@example.com"]
}
