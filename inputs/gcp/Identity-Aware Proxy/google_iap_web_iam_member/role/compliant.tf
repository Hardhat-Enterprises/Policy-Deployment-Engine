resource "google_iap_web_iam_member" "compliant_example_1" {
  project = "c"
  role    = "roles/iap.httpsResourceAccessor"  # least privilege
  member  = "user:jane@example.com"
}
