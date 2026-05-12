resource "google_data_catalog_tag_template_iam_binding" "nc" {
  project      = "other-project-12345"
  region       = "australia-southeast1"
  tag_template = "approved_template"
  role         = "roles/datacatalog.viewer"
  members      = ["user:security@example.com"]
}
