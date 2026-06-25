data "google_iam_policy" "nc" {
  binding {
    role    = "roles/datacatalog.viewer"
    members = ["allUsers"]
  }
}

resource "google_data_catalog_tag_template_iam_policy" "non_compliant_example_1" {
  project      = "gcp-project-12345"
  region       = "australia-southeast1"
  tag_template = "approved_template"
  policy_data  = data.google_iam_policy.nc.policy_data
}

data "google_iam_policy" "nc2" {
  binding {
    role    = "roles/datacatalog.admin"
    members = ["user:security@example.com"]
  }
}

resource "google_data_catalog_tag_template_iam_policy" "non_compliant_example_2" {
  project      = "gcp-project-12345"
  region       = "australia-southeast1"
  tag_template = "approved_template"
  policy_data  = data.google_iam_policy.nc2.policy_data
}
