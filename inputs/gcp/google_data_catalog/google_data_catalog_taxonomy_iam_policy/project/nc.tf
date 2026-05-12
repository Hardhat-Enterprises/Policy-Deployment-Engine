data "google_iam_policy" "nc" {
  binding {
    role    = "roles/datacatalog.viewer"
    members = ["user:security@example.com"]
  }
}

resource "google_data_catalog_taxonomy_iam_policy" "nc" {
  project     = "other-project-12345"
  region      = "australia-southeast1"
  taxonomy    = "approved_taxonomy"
  policy_data = data.google_iam_policy.nc.policy_data
}
