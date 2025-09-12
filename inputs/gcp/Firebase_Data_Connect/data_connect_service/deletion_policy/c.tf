resource "google_firebase_data_connect_service" "c" {
  display_name = "firebase data connect service-c"
  project = "my-project-name"
  location = "us-central1"
  service_id = "example-service"
  deletion_policy = "FORCE"
  provider = google-beta
}
