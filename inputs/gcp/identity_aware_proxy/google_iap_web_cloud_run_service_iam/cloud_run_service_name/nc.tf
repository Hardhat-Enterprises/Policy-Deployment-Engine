resource "google_iap_web_cloud_run_service_iam_member" "nc1" {
  project                = "nc1"
  location               = "us-central1"
  cloud_run_service_name = "grafana"
  role                   = "roles/iap.httpsResourceAccessor"
  member                 = "user:jane@example.com"
}

resource "google_iap_web_cloud_run_service_iam_member" "nc2" {
  project                = "nc2"
  location               = "us-central1"
  cloud_run_service_name = "orders-be"        # missing env segment
  role                   = "roles/iap.httpsResourceAccessor"
  member                 = "user:jane@example.com"
}

resource "google_iap_web_cloud_run_service_iam_member" "nc3" {
  project                = "nc3"
  location               = "us-central1"
  cloud_run_service_name = "orders-be-qa"     # env not in {dev,stg,prod}
  role                   = "roles/iap.httpsResourceAccessor"
  member                 = "user:jane@example.com"
}