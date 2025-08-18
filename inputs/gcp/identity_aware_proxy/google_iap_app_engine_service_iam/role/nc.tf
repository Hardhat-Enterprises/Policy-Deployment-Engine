# Overly broad, not the least-privilege IAP access role
resource "google_iap_app_engine_service_iam_member" "nc_role_editor" {
  app_id  = "my-gcp-project"
  service = "default"
  role    = "roles/editor"                      #too broad
  member  = "user:jane@example.com"
}

# Owner privileges
resource "google_iap_app_engine_service_iam_member" "nc_role_owner" {
  app_id  = "my-gcp-project"
  service = "default"
  role    = "roles/owner"                       #far too broad
  member  = "user:jane@example.com"
}

# IAP admin (manage IAP configs; not the access role)
resource "google_iap_app_engine_service_iam_member" "nc_role_iap_admin" {
  app_id  = "my-gcp-project"
  service = "default"
  role    = "roles/iap.admin"                   #admin, not accessor
  member  = "user:jane@example.com"
}

# Wrong product role (Cloud Run invoker, not App Engine IAP)
resource "google_iap_app_engine_service_iam_member" "nc_role_run_invoker" {
  app_id  = "my-gcp-project"
  service = "default"
  role    = "roles/run.invoker"                 #unrelated to App Engine IAP
  member  = "user:jane@example.com"
}

# Custom project role (if your policy forbids custom roles here)
resource "google_iap_app_engine_service_iam_member" "nc_role_custom" {
  app_id  = "my-gcp-project"
  service = "default"
  role    = "projects/my-gcp-project/roles/CustomBroadRole"  #custom role
  member  = "user:jane@example.com"
}