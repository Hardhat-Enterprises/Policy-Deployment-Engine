resource "google_iap_web_backend_service_iam_member" "nc_role_owner" {
  project             = "my-gcp-project"
  web_backend_service = "my-backend"
  role                = "roles/owner"        #  too broad
  member              = "user:jane@example.com"
}

resource "google_iap_web_backend_service_iam_member" "nc_role_editor" {
  project             = "my-gcp-project"
  web_backend_service = "my-backend"
  role                = "roles/editor"       #  too broad
  member              = "user:jane@example.com"
}

resource "google_iap_web_backend_service_iam_member" "nc_role_viewer" {
  project             = "my-gcp-project"
  web_backend_service = "my-backend"
  role                = "roles/viewer"       #  not the accessor
  member              = "user:jane@example.com"
}

resource "google_iap_web_backend_service_iam_member" "nc_role_iap_admin" {
  project             = "my-gcp-project"
  web_backend_service = "my-backend"
  role                = "roles/iap.admin"    #  admin, not accessor
  member              = "user:jane@example.com"
}

resource "google_iap_web_backend_service_iam_member" "nc_role_run_invoker" {
  project             = "my-gcp-project"
  web_backend_service = "my-backend"
  role                = "roles/run.invoker"  #  wrong product role
  member              = "user:jane@example.com"
}

resource "google_iap_web_backend_service_iam_member" "nc_role_custom" {
  project             = "my-gcp-project"
  web_backend_service = "my-backend"
  role                = "projects/my-gcp-project/roles/CustomBroadRole"  #  custom
  member              = "user:jane@example.com"
}
