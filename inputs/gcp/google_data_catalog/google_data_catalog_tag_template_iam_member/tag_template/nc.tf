resource "google_data_catalog_tag_template_iam_member" "nc" {
  project      = "gcp-project-12345"
  region       = "australia-southeast1"
  tag_template = "other_template"
  role         = "roles/datacatalog.viewer"
  member       = "user:security@example.com"
}
