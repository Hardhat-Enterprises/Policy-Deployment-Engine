# Overly broad project roles
resource "google_iap_app_engine_service_iam_member" "nc_role_owner" {
  app_id  = "my-gcp-project"
  service = "default"
  role    = "roles/owner"                        #  far too broad
  member  = "user:jane@example.com"
}

resource "google_iap_app_engine_service_iam_member" "nc_role_editor" {
  app_id  = "my-gcp-project"
  service = "default"
  role    = "roles/editor"                       #  too broad
  member  = "user:jane@example.com"
}

resource "google_iap_app_engine_service_iam_member" "nc_role_viewer" {
  app_id  = "my-gcp-project"
  service = "default"
  role    = "roles/viewer"                       #  not the accessor role
  member  = "user:jane@example.com"
}

# IAP admin (manages IAP config, not access)
resource "google_iap_app_engine_service_iam_member" "nc_role_iap_admin" {
  app_id  = "my-gcp-project"
  service = "default"
  role    = "roles/iap.admin"                    #  admin, not accessor
  member  = "user:jane@example.com"
}

# Wrong product role
resource "google_iap_app_engine_service_iam_member" "nc_role_run_invoker" {
  app_id  = "my-gcp-project"
  service = "default"
  role    = "roles/run.invoker"                  #  unrelated to App Engine IAP
  member  = "user:jane@example.com"
}

# Custom role (if your org forbids custom roles here)
resource "google_iap_app_engine_service_iam_member" "nc_role_custom" {
  app_id  = "my-gcp-project"
  service = "default"
  role    = "projects/my-gcp-project/roles/CustomBroadRole"  #  custom
  member  = "user:jane@example.com"
}
