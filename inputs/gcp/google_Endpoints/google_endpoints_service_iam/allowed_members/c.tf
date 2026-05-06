resource "google_endpoints_service_iam_binding" "c" {
  service_name = "api.endpoints.my-project-123.cloud.goog"
  role = "roles/viewer"

  members = [
    "user:alice@example.com",
    "group:admins@example.com",
    "serviceAccount:svc-my-app@my-project-123.iam.gserviceaccount.com"
  ]
}