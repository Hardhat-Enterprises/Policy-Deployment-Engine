resource "google_endpoints_service_iam_binding" "nc" {
  service_name = "nc"
  role = "roles/endpoints.serviceAgent"

  members = [
    "user:alice@example.com"
  ]
}