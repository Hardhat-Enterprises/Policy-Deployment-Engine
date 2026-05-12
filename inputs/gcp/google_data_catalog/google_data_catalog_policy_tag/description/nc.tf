resource "google_data_catalog_policy_tag" "nc" {
  taxonomy          = "projects/gcp-project-12345/locations/australia-southeast1/taxonomies/approved_taxonomy"
  display_name      = "approved_policy_tag"
  description       = ""
  parent_policy_tag = "projects/gcp-project-12345/locations/australia-southeast1/taxonomies/approved_taxonomy/policyTags/approved_parent"
}
