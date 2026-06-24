resource "google_gke_hub_feature_iam_binding" "compliant_example_1" {
  project  = "example-project-123"
  location = "global"
  name     = "compliant_example_1"
  role     = "roles/gkehub.viewer"
  
  members = [
    "user:alice@example.com",
    "user:bob@example.com",
  ]
}

