resource "google_billing_account_iam_member" "c" {
  billing_account_id = "00AA00-000AAA-00AA0A"
  role               = "roles/billing.viewer"
  member             = "user:jane@organization.org"
}