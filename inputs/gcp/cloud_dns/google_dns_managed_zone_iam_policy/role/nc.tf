

resource "google_dns_managed_zone_iam_binding" "nc" {
  project      = "demo-project"
  managed_zone = "nc"
  role         = "roles/owner"
  members = [
    "user:jane@example.com",
  ]
}