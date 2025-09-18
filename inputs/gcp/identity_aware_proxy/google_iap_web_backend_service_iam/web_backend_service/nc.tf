# nc1: sensitive admin backend exposed
resource "google_iap_web_backend_service_iam_member" "nc1" {
  project             = "nc1"
  web_backend_service = "grafana"
  role                = "roles/iap.httpsResourceAccessor"
  member              = "group:ops@example.com"
}

# nc2: naming policy not met (missing -iap)
resource "google_iap_web_backend_service_iam_member" "nc2" {
  project             = "nc2"
  web_backend_service = "orders-edge"
  role                = "roles/iap.httpsResourceAccessor"
  member              = "group:orders-iap-access@example.com"
}
