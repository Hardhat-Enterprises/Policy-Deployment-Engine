resource "google_endpoints_service_iam_binding" "nc" {
  service_name = "api.endpoints.my-project-123.cloud.goog"
  role         = "roles/endpoints.serviceAgent"

  members = [
    "user:alice@example.com"
  ]
}