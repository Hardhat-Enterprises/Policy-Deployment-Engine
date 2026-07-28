resource "google_data_catalog_tag_template_iam_binding" "non_compliant_example_1" {
  project      = "gcp-project-12345"
  region       = "us-central1"
  tag_template = "approved_template"
  role         = "roles/datacatalog.viewer"
  members      = ["user:security@example.com"]
}
