

data "google_iam_policy" "admin_public" {
  binding {
    role = "roles/owner"
    members = [
      "user:jane@example.com",
    ]
  }
}

resource "google_dns_managed_zone_iam_policy" "nc" {
  project      = "demo-project"
  managed_zone = "example-zone-public"
  policy_data  = data.google_iam_policy.admin_public.policy_data
}