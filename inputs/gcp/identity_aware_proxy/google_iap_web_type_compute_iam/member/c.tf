resource "google_iap_web_type_compute_iam_member" "c_compute_member" {
  project  = "my-gcp-project"
  role     = "roles/iap.httpsResourceAccessor"
  member   = "user:jane@example.com"
}
