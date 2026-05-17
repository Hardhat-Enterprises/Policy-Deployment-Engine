resource "google_iam_principal_access_boundary_policy" "nc" {
  organization   = "234"
  location       = "global"
  display_name   = "nc"
  principal_access_boundary_policy_id = "pab-policy-for-org"
}