resource "google_cloudbuildv2_connection_iam_member" "non_compliant" {
  name     = "insecure-public-access"
  project  = "insecure-project"
  location = "global"
  role     = "roles/viewer"
  member   = "allUsers"  # Publicly accessible
}
