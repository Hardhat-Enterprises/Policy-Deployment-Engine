resource "google_firebase_app_check_service_config" "nc" {
  project    = "my-project-id"
  service_id = "unwhitelisted.googleapis.com"
}