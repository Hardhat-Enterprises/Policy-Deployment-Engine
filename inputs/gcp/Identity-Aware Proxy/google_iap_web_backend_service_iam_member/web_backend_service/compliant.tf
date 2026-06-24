resource "google_iap_web_backend_service_iam_member" "compliant_example_1" {
  project             = "c"
  web_backend_service = "orders-edge-iap"  # passes -iap regex
  role                = "roles/iap.httpsResourceAccessor"
  member              = "group:orders-iap-access@example.com"
}
