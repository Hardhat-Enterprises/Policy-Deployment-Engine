resource "google_iap_web_iam_member" "nc1" {
  project = "nc1"
  role    = "roles/iap.httpsResourceAccessor"
  member  = "user:jane@example.com"
}
