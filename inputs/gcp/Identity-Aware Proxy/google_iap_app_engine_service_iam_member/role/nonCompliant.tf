# Overly broad project roles
resource "google_iap_app_engine_service_iam_member" "non_compliant_example_1" {
  app_id  = "non_compliant_example_1"
  service = "default"
  role    = "roles/owner"                        #  far too broad
  member  = "user:jane@example.com"
}

resource "google_iap_app_engine_service_iam_member" "non_compliant_example_2" {
  app_id  = "non_compliant_example_2"
  service = "default"
  role    = "roles/editor"                       #  too broad
  member  = "user:jane@example.com"
}

resource "google_iap_app_engine_service_iam_member" "non_compliant_example_3" {
  app_id  = "non_compliant_example_3"
  service = "default"
  role    = "roles/viewer"                       #  not the accessor role
  member  = "user:jane@example.com"
}

# IAP admin (manages IAP config, not access)
resource "google_iap_app_engine_service_iam_member" "non_compliant_example_4" {
  app_id  = "non_compliant_example_4"
  service = "default"
  role    = "roles/iap.admin"                    #  admin, not accessor
  member  = "user:jane@example.com"
}

# Wrong product role
resource "google_iap_app_engine_service_iam_member" "non_compliant_example_5" {
  app_id  = "non_compliant_example_5"
  service = "default"
  role    = "roles/run.invoker"                  #  unrelated to App Engine IAP
  member  = "user:jane@example.com"
}

# Custom role (if your org forbids custom roles here)
resource "google_iap_app_engine_service_iam_member" "non_compliant_example_6" {
  app_id  = "non_compliant_example_6"
  service = "default"
  role    = "projects/my-gcp-project/roles/CustomBroadRole"  #  custom
  member  = "user:jane@example.com"
}
