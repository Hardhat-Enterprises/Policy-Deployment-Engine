# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_billing_account_iam_member" "nc" {
  billing_account_id = "00AA00-000AAA-00AA0A"
  role               = "roles/billing.viewer"
  member             = "user:jane@example.com"
}