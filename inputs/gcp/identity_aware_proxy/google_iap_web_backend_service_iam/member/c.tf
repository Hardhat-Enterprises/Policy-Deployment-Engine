resource "google_iap_web_backend_service_iam_member" "c_backend_member" {
  project              = "my-gcp-project"
  web_backend_service  = "my-backend"
  role                 = "roles/iap.httpsResourceAccessor"
  member               = "user:jane@example.com"
}
