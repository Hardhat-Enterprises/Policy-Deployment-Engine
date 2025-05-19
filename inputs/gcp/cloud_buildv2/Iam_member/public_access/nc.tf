resource "google_cloudbuildv2_connection_iam_member" "nc" {
  name     = "public-connection-member"
  project  = "policy-deplo"
  location = "global"
  role     = "roles/viewer"
  member   = "allUsers"  #  public access
}

