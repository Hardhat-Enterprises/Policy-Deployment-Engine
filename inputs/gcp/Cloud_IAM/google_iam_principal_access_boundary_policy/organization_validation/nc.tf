resource "google_iam_principal_access_boundary_policy" "nc" {
  organization   = "org-123abc"   
  location       = "global"
  display_name   = "Non-Compliant PAB Policy"
  principal_access_boundary_policy_id = "pab-org-nc"

  details {
    rules {
      effect = "ALLOW"
      resources = [
        "//cloudresourcemanager.googleapis.com/organizations/123456789"
      ]
    }
  }
}