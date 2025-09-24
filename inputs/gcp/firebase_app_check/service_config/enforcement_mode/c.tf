# Compliant service_config: enforcement_mode is ENFORCED

resource "google_firebase_app_check_service_config" "c" {
  project    = "ankita-firebase-appcheck-id" 
  service_id       = "my-service-id"
  enforcement_mode = "ENFORCED"
}