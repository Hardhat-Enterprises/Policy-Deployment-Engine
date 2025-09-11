# Overly broad project roles
resource "google_iap_app_engine_service_iam_member" "nc1" {
  app_id  = "nc1"
  service = "default"
  role    = "roles/owner"                        #  far too broad
  member  = "user:jane@example.com"
}

resource "google_iap_app_engine_service_iam_member" "nc2" {
  app_id  = "nc2"
  service = "default"
  role    = "roles/editor"                       #  too broad
  member  = "user:jane@example.com"
}

resource "google_iap_app_engine_service_iam_member" "nc3" {
  app_id  = "nc3"
  service = "default"
  role    = "roles/viewer"                       #  not the accessor role
  member  = "user:jane@example.com"
}

# IAP admin (manages IAP config, not access)
resource "google_iap_app_engine_service_iam_member" "nc4" {
  app_id  = "nc4"
  service = "default"
  role    = "roles/iap.admin"                    #  admin, not accessor
  member  = "user:jane@example.com"
}

# Wrong product role
resource "google_iap_app_engine_service_iam_member" "nc5" {
  app_id  = "nc5"
  service = "default"
  role    = "roles/run.invoker"                  #  unrelated to App Engine IAP
  member  = "user:jane@example.com"
}

# Custom role (if your org forbids custom roles here)
resource "google_iap_app_engine_service_iam_member" "nc6" {
  app_id  = "nc6"
  service = "default"
  role    = "projects/my-gcp-project/roles/CustomBroadRole"  #  custom
  member  = "user:jane@example.com"
}
