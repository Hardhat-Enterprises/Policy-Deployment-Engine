resource "google_cloudbuildv2_connection_iam_member" "nc" {
  name     = "overprivileged-connection-member"
  project  = "policy-deplo"
  location = "global"
  role     = "roles/owner"  # too much power
  member   = "user:iamboss@gmail.com"
}
