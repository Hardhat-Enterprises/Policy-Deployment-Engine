resource "google_data_catalog_policy_tag" "c" {
  taxonomy          = "projects/gcp-project-12345/locations/australia-southeast1/taxonomies/approved_taxonomy"
  display_name      = "approved_policy_tag"
  description       = "Policy tag for approved confidential data."
  parent_policy_tag = "projects/gcp-project-12345/locations/australia-southeast1/taxonomies/approved_taxonomy/policyTags/approved_parent"
}
