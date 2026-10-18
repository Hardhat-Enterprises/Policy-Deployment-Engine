resource "google_gke_hub_feature_iam_member" "non_compliant_example_1" {
  project  = "example-project-123"
  location = "global"
  name     = "non_compliant_example_1"
  role     = "roles/gkehub.viewer"
  member   = "allUsers"   
}
