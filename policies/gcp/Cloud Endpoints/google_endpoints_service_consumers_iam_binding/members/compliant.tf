resource "google_endpoints_service_consumers_iam_binding" "compliant_example_1" {
  service_name     = "api.endpoints.my-project-123.cloud.goog"
  consumer_project = "compliant_example_1"
  role             = "roles/servicemanagement.serviceConsumer"
  members          = ["user:alice@example.com"]
}
