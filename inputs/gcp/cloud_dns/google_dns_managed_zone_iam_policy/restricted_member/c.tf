

resource "google_dns_managed_zone_iam_binding" "c" {
  project      = "demo-project"
  managed_zone = "c"
  role         = "roles/viewer"
  members = [
    "user:jane@example.com",
  ]
}