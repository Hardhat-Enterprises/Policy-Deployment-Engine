# Non-compliant service_config: enforcement_mode is UNENFORCED

resource "google_firebase_app_check_service_config" "nc" {
  project    = "ankita-firebase-appcheck-id" 
  service_id       = "my-service-id"
  enforcement_mode = "UNENFORCED"
}