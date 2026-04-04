# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_billing_account_iam_member" "nc" {
  billing_account_id = ""
  role               = "roles/billing.viewer"
  member             = "user:jane@example.com"
}