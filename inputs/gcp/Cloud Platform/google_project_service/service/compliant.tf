resource "google_project_service" "compliant_example_1" {
  project = "secure-project"
  service = "iam.googleapis.com"
}
