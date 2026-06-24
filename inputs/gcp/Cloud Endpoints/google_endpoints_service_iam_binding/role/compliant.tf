resource "google_endpoints_service_iam_binding" "compliant_example_1" {
  service_name = "c"
  role         = "roles/viewer"

  members = [
    "user:alice@example.com"
  ]
}
