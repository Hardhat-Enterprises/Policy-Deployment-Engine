resource "google_billing_account_iam_member" "non_compliant_example_1" {
  billing_account_id = ""
  role               = "roles/billing.viewer"
  member             = "user:jane@example.com"
}
