resource "google_project_service" "non_compliant_example_1" {
  project = "secure-project"
  service = "storage.googleapis.com"
}
