resource "google_firebase_data_connect_service" "nc" {
  display_name = "nc"
  project = "my-project-name"
  location = "us-central1"
  service_id = "example-service"
  deletion_policy = "DEFAULT"
  provider = google-beta

}