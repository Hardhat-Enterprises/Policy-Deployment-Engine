resource "google_firebase_app_check_service_config" "nc" {
  service_id = "firebasestorage.googleapis.com"
  enforcement_mode = "UNENFORCED"
}
