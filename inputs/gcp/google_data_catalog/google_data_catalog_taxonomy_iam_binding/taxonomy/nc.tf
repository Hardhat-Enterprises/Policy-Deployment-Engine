resource "google_data_catalog_taxonomy_iam_binding" "nc" {
  project  = "gcp-project-12345"
  region   = "australia-southeast1"
  taxonomy = "other_taxonomy"
  role     = "roles/datacatalog.viewer"
  members  = ["user:security@example.com"]
}
