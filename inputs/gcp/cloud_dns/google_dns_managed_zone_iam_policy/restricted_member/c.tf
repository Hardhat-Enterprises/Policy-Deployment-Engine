data "google_iam_policy" "admin" {
  binding {
    role = "roles/viewer"
    members = [
      "user:jane@example.com",
    ]
  }
}
resource "google_dns_managed_zone_iam_policy" "c" {
  project      = "demo-project"
  managed_zone = "c"
  policy_data  = data.google_iam_policy.admin.policy_data
}