resource "google_iam_principal_access_boundary_policy" "nc" {
  organization   = "234"
  location       = "global"
  display_name   = "PAB policy for Organization"
  principal_access_boundary_policy_id = "pab-policy-for-org"
}