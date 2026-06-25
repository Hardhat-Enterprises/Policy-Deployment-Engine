resource "google_endpoints_service_consumers_iam_binding" "non_compliant_example_1" {
  service_name     = "api.endpoints.my-project-123.cloud.goog"
  consumer_project = "non_compliant_example_1"
  role             = "roles/viewer"

  members = [
    "user:alice@example.com"
  ]
}
