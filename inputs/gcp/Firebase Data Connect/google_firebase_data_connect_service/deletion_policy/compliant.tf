resource "google_firebase_data_connect_service" "compliant_example_1" {
  display_name = "compliant_example_1"
  project = "my-project-name"
  location = "us-central1"
  service_id = "example-service"
  deletion_policy = "FORCE"
  provider = google-beta
}
