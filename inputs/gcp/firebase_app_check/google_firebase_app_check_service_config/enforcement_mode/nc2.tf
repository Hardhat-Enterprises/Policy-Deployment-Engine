# Non-compliant: enforcement_mode is UNENFORCED
# This bypasses App Check verification, leaving the backend vulnerable to unauthorized requests.
resource "google_firebase_app_check_service_config" "nc2" {
  project      = "my-project"
  service_id   = "firestore.googleapis.com"
  enforcement_mode = "UNENFORCED"
}
