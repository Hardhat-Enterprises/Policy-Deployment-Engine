resource "google_firebase_data_connect_service" "non_compliant_example_1" {
  display_name = "non_compliant_example_1"
  project = "my-project-name"
  location = "us-central1"
  service_id = "example-service"
  deletion_policy = "DEFAULT"
  provider = google-beta

}
