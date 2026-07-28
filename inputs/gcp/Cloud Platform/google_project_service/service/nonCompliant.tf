resource "google_project_service" "non_compliant_example_1" {
  project = "noncompliant-project"
  service = "storage.googleapis.com"
}
