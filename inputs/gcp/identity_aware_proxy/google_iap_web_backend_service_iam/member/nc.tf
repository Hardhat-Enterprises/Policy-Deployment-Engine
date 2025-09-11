resource "google_iap_web_backend_service_iam_member" "nc1" {
  project             = "nc1"
  web_backend_service = "menu-be"
  role    = "roles/iap.httpsResourceAccessor"
  member  = "users:jane@example.com"
}

resource "google_iap_web_backend_service_iam_member" "nc2" {
  project             = "nc2"
  web_backend_service = "payments-be"
  role    = "roles/iap.httpsResourceAccessor"
  member  = "allUsers"
}

resource "google_iap_web_backend_service_iam_member" "nc3" {
  project             = "nc3"
  web_backend_service = "loyalty-be"
  role    = "roles/iap.httpsResourceAccessor"
  member  = "allAuthenticatedUsers"
}

resource "google_iap_web_backend_service_iam_member" "nc4" {
  project             = "nc4"
  web_backend_service = "reporting-be"
  role    = "roles/iap.httpsResourceAccessor"
  member  = "domain:example.com"
}

resource "google_iap_web_backend_service_iam_member" "nc5" {
  project             = "nc5"
  web_backend_service = "inventory-be"
  role    = "roles/iap.httpsResourceAccessor"
  member  = "group:eng@@example.com"
}

resource "google_iap_web_backend_service_iam_member" "nc6" {
  project             = "nc6"
  web_backend_service = "kitchen-display-be"
  role    = "roles/iap.httpsResourceAccessor"
  member  = "serviceAccount:not-an-email"
}

resource "google_iap_web_backend_service_iam_member" "nc7" {
  project             = "nc7"
  web_backend_service = "notifications-be"
  role    = "roles/iap.httpsResourceAccessor"
  member  = " user:jane@example.com "
}

resource "google_iap_web_backend_service_iam_member" "nc8" {
  project             = "nc8"
  web_backend_service = "pos-gateway-be"
  role    = "roles/iap.httpsResourceAccessor"
  member  = "user:jane@gmail.com"
}
