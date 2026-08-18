resource "google_data_catalog_taxonomy" "compliant_example_1" {
  display_name           = "Approved Taxonomy"
  description            = "Taxonomy for approved sensitive data classification."
  region                 = "australia-southeast1"
  project                = "gcp-project-12345"
  activated_policy_types = ["FINE_GRAINED_ACCESS_CONTROL"]
}
