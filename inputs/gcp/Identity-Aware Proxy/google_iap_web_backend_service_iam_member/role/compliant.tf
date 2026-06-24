resource "google_iap_web_backend_service_iam_member" "compliant_example_1" {
  project             = "c"
  web_backend_service = "orders-edge-iap"
  role                = "roles/iap.httpsResourceAccessor"  #  least privilege
  member              = "user:jane@example.com"
}
