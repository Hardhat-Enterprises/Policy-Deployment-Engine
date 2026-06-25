resource "google_billing_account_iam_member" "compliant_example_1" {
  billing_account_id = "00AA00-000AAA-00AA0A"
  role               = "roles/billing.viewer"
  member             = "user:jane@example.com"
}
