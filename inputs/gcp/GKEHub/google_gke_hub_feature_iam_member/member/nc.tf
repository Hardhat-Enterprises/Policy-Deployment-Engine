resource "google_gke_hub_feature_iam_member" "nc" {
  project  = "example-project-123"
  location = "global"
  name     = "nc"
  role     = "roles/gkehub.viewer"
  member   = "allUsers"   
}
