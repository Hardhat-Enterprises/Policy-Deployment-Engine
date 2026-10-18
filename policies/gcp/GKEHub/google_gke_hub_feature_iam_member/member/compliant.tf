resource "google_gke_hub_feature_iam_member" "compliant_example_1" {
  project  = "example-project-123"
  location = "global"
  name     = "compliant_example_1"
  role     = "roles/gkehub.viewer"
  member   = "group:secops@example.com"  
}
