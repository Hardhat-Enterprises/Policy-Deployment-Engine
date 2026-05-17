resource "google_iam_principal_access_boundary_policy" "c" {
  organization   = "123456789"
  location       = "global"
  display_name   = "c"
  principal_access_boundary_policy_id = "pab-policy-c"

  details {
    rules {
      effect = "ALLOW"
      resources = [
        "//cloudresourcemanager.googleapis.com/organizations/123456789"
      ]
    }
  }
}