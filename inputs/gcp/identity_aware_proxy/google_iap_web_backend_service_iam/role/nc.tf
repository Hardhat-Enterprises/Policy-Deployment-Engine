resource "google_iap_web_backend_service_iam_member" "nc1" {
  project             = "nc1"
  web_backend_service = "orders-edge-iap"
  role                = "roles/owner"        #  too broad
  member              = "user:jane@example.com"
}

resource "google_iap_web_backend_service_iam_member" "nc2" {
  project             = "nc2"
  web_backend_service = "menu-be"
  role                = "roles/editor"       #  too broad
  member              = "user:jane@example.com"
}

resource "google_iap_web_backend_service_iam_member" "nc3" {
  project             = "nc3"
  web_backend_service = "payment-be"
  role                = "roles/viewer"       #  not the accessor
  member              = "user:jane@example.com"
}

resource "google_iap_web_backend_service_iam_member" "nc4" {
  project             = "nc4"
  web_backend_service = "loyalty-be"
  role                = "roles/iap.admin"    #  admin, not accessor
  member              = "user:jane@example.com"
}

resource "google_iap_web_backend_service_iam_member" "nc5" {
  project             = "nc5"
  web_backend_service = "reporting-be"
  role                = "roles/run.invoker"  #  wrong product role
  member              = "user:jane@example.com"
}

resource "google_iap_web_backend_service_iam_member" "nc6" {
  project             = "nc6"
  web_backend_service = "inventory-be"
  role                = "projects/my-gcp-project/roles/CustomBroadRole"  #  custom
  member              = "user:jane@example.com"
}
