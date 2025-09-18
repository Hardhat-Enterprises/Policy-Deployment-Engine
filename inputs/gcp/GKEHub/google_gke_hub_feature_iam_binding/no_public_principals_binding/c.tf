resource "google_gke_hub_feature_iam_binding" "c" {
  project  = "example-project-123"
  location = "global"
  name     = "c"
  role     = "roles/gkehub.viewer"
  
  members = [
    "user:alice@example.com",
    "user:bob@example.com",
  ]
}

