resource "google_iap_web_backend_service_iam_member" "c_backend_role" {
  project             = "my-gcp-project"
  web_backend_service = "my-backend"
  role                = "roles/iap.httpsResourceAccessor"  #  least privilege
  member              = "user:jane@example.com"
}
