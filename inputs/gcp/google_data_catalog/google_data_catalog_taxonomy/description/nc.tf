resource "google_data_catalog_taxonomy" "nc" {
  display_name           = "Approved Taxonomy"
  description            = ""
  region                 = "australia-southeast1"
  project                = "gcp-project-12345"
  activated_policy_types = ["FINE_GRAINED_ACCESS_CONTROL"]
}
