resource "google_billing_account_iam_member" "nc" {
  billing_account_id = ""
  role               = "roles/billing.viewer"
  member             = "user:jane@example.com"
}