resource "google_iap_web_iam_member" "c" {
  project = "c"
  role    = "roles/iap.httpsResourceAccessor"  # least privilege
  member  = "user:jane@example.com"
}
