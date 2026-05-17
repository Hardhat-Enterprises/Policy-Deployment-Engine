resource "google_iam_principal_access_boundary_policy" "c" {
  organization   = "PDE1"
  location       = "global"
  display_name   = "c"
  principal_access_boundary_policy_id = "pab-policy-for-org"
}