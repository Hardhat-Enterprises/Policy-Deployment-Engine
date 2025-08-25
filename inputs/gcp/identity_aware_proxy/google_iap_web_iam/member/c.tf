resource "google_iap_web_iam_member" "c_web_member" {
  project = "my-gcp-project"
  role    = "roles/iap.httpsResourceAccessor"
  member  = "user:jane@example.com"
}
