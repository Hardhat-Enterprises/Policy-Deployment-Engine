resource "google_endpoints_service_consumers_iam_binding" "c" {
  service_name     = "api.endpoints.my-project-123.cloud.goog"
  consumer_project = "c"
  role             = "roles/servicemanagement.serviceConsumer"

  members = [
    "user:alice@example.com"
  ]
}