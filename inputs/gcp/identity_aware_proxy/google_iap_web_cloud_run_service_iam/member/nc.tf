resource "google_iap_web_cloud_run_service_iam_member" "nc1" {
  project                = "nc1"
  location               = "us-central1"
  cloud_run_service_name = "my-cloud-run-service"
  role                   = "roles/iap.httpsResourceAccessor"
  member                 = "users:jane@example.com"
}

resource "google_iap_web_cloud_run_service_iam_member" "nc2" {
  project                = "nc2"
  location               = "us-central1"
  cloud_run_service_name = "my-cloud-run-service"
  role                   = "roles/iap.httpsResourceAccessor"
  member                 = "allUsers"
}

resource "google_iap_web_cloud_run_service_iam_member" "nc3" {
  project                = "nc3"
  location               = "us-central1"
  cloud_run_service_name = "my-cloud-run-service"
  role                   = "roles/iap.httpsResourceAccessor"
  member                 = "allAuthenticatedUsers"
}

resource "google_iap_web_cloud_run_service_iam_member" "nc4" {
  project                = "nc4"
  location               = "us-central1"
  cloud_run_service_name = "my-cloud-run-service"
  role                   = "roles/iap.httpsResourceAccessor"
  member                 = "domain:example.com"
}

resource "google_iap_web_cloud_run_service_iam_member" "nc5" {
  project                = "nc5"
  location               = "us-central1"
  cloud_run_service_name = "my-cloud-run-service"
  role                   = "roles/iap.httpsResourceAccessor"
  member                 = "group:eng@@example.com"
}

resource "google_iap_web_cloud_run_service_iam_member" "nc6" {
  project                = "nc6"
  location               = "us-central1"
  cloud_run_service_name = "my-cloud-run-service"
  role                   = "roles/iap.httpsResourceAccessor"
  member                 = "serviceAccount:not-an-email"
}

resource "google_iap_web_cloud_run_service_iam_member" "nc7" {
  project                = "nc7"
  location               = "us-central1"
  cloud_run_service_name = "my-cloud-run-service"
  role                   = "roles/iap.httpsResourceAccessor"
  member                 = " user:jane@example.com "
}

resource "google_iap_web_cloud_run_service_iam_member" "nc8" {
  project                = "nc8"
  location               = "us-central1"
  cloud_run_service_name = "my-cloud-run-service"
  role                   = "roles/iap.httpsResourceAccessor"
  member                 = "user:jane@gmail.com"
}
