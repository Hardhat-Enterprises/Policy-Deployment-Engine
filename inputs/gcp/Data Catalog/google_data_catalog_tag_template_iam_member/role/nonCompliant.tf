resource "google_data_catalog_tag_template_iam_member" "non_compliant_example_1" {
  project      = "gcp-project-12345"
  region       = "australia-southeast1"
  tag_template = "approved_template"
  role         = "roles/datacatalog.admin"
  member       = "user:security@example.com"
}
