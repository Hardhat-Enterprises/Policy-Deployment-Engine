resource "google_iap_web_iam_member" "c_web_role" {
  project = "my-gcp-project"
  role    = "roles/iap.httpsResourceAccessor"  # least privilege
  member  = "user:jane@example.com"
}
