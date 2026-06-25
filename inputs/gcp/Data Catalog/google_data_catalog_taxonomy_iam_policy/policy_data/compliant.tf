data "google_iam_policy" "c" {
  binding {
    role    = "roles/datacatalog.viewer"
    members = ["user:security@example.com"]
  }
}

resource "google_data_catalog_taxonomy_iam_policy" "compliant_example_1" {
  project     = "gcp-project-12345"
  region      = "australia-southeast1"
  taxonomy    = "approved_taxonomy"
  policy_data = data.google_iam_policy.c.policy_data
}

resource "google_data_catalog_taxonomy_iam_policy" "compliant_example_2" {
  project     = "gcp-project-12345"
  region      = "australia-southeast1"
  taxonomy    = "approved_taxonomy"
  policy_data = data.google_iam_policy.c.policy_data
}
