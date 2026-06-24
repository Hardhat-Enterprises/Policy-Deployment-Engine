resource "google_endpoints_service_iam_binding" "non_compliant_example_1" {
  service_name = "nc"
  role = "roles/endpoints.serviceAgent"

  members = [
    "user:alice@example.com"
  ]
}
