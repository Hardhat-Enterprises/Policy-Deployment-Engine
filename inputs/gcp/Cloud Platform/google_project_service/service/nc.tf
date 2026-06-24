resource "google_project_service" "nc" {
  project = "noncompliant-project"
  service = "storage.googleapis.com"
}