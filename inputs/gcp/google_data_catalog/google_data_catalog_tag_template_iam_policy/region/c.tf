data "google_iam_policy" "c" {
  binding {
    role    = "roles/datacatalog.viewer"
    members = ["user:security@example.com"]
  }
}

resource "google_data_catalog_tag_template_iam_policy" "c" {
  project      = "gcp-project-12345"
  region       = "australia-southeast1"
  tag_template = "approved_template"
  policy_data  = data.google_iam_policy.c.policy_data
}
