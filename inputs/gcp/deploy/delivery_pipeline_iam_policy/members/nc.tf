data "google_iam_policy" "nc" {
  binding {
    role = "roles/clouddeploy.releaser"
    members = [
      "allUsers",
      "allAuthenticatedUsers",
      "user:admin@gmail.com"
    ]
  }
}

resource "google_clouddeploy_delivery_pipeline_iam_policy" "nc" {
  name        = "delivery-pipeline-nc"
  location    = "us-central1"
  project     = "my-project-id"
  policy_data = data.google_iam_policy.nc.policy_data
}