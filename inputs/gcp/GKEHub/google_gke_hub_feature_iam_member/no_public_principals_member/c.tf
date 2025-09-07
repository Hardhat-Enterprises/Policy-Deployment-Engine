resource "google_gke_hub_feature_iam_member" "c" {
  project  = "example-project-123"
  location = "global"
  name     = "policycontroller-c"
  role     = "roles/gkehub.viewer"
  member   = "group:secops@example.com"  
}
