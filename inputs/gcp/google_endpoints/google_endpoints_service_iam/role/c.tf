resource "google_endpoints_service_iam_binding" "c" {
  service_name = "c"
  role         = "roles/viewer"

  members = [
    "user:alice@example.com"
  ]
}