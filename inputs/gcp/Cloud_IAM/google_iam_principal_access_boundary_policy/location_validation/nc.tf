resource "google_iam_principal_access_boundary_policy" "nc" {
  organization   = "123456789"
  location       = "australia-southeast1"  
  display_name   = "Non-Compliant PAB Policy"
  principal_access_boundary_policy_id = "pab-policy-nc"

  details {
    rules {
      effect = "ALLOW"
      resources = [
        "//cloudresourcemanager.googleapis.com/organizations/123456789"
      ]
    }
  }
}