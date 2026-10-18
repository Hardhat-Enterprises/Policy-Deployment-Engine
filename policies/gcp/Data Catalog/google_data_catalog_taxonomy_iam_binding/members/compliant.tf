resource "google_data_catalog_taxonomy_iam_binding" "compliant_example_1" {
  project  = "gcp-project-12345"
  region   = "australia-southeast1"
  taxonomy = "approved_taxonomy"
  role     = "roles/datacatalog.viewer"
  members  = ["user:security@example.com"]
}
