data "google_iam_policy" "nc" {
  binding {
    role    = "roles/datacatalog.viewer"
    members = ["user:security@example.com"]
  }
}

resource "google_data_catalog_tag_template_iam_policy" "non_compliant_example_1" {
  project      = "gcp-project-12345"
  region       = "us-central1"
  tag_template = "approved_template"
  policy_data  = data.google_iam_policy.nc.policy_data
}
