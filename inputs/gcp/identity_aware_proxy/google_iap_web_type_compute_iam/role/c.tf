resource "google_iap_web_type_compute_iam_member" "c_compute_role" {
  project = "my-gcp-project"
  role    = "roles/iap.httpsResourceAccessor"  #  least privilege
  member  = "user:jane@example.com"
}
