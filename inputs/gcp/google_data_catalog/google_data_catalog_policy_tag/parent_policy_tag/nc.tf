resource "google_data_catalog_policy_tag" "nc" {
  taxonomy          = "projects/gcp-project-12345/locations/australia-southeast1/taxonomies/approved_taxonomy"
  display_name      = "approved_policy_tag"
  description       = "Policy tag for approved confidential data."
  parent_policy_tag = "projects/other-project-12345/locations/us-central1/taxonomies/other_taxonomy/policyTags/other_parent"
}
