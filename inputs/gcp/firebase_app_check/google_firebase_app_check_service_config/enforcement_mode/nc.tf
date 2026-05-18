resource "google_firebase_app_check_service_config" "nc" {
  service_id       = "nc"
  enforcement_mode = "UNENFORCED"
}
