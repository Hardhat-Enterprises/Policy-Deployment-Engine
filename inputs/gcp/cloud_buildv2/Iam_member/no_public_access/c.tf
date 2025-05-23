resource "google_cloudbuildv2_connection_iam_member" "compliant" {
  name     = "secure-connection-member"
  project  = "secure-project"
  location = "global"
  role     = "roles/viewer"
  member   = "user:devops@example.com"
}
