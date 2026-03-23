resource "google_firebase_app_check_service_config" "c" {
  service_id = "firebasestorage.googleapis.com"
  enforcement_mode = "ENFORCED"
}
