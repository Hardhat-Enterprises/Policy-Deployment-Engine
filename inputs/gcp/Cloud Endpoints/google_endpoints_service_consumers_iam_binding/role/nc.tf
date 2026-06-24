resource "google_endpoints_service_consumers_iam_binding" "nc" {
  service_name     = "api.endpoints.my-project-123.cloud.goog"
  consumer_project = "nc"
  role             = "roles/viewer"

  members = [
    "user:alice@example.com"
  ]
}