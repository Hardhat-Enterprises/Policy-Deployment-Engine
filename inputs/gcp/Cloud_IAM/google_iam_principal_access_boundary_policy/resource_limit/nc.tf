resource "google_iam_principal_access_boundary_policy" "nc" {
  organization = "123456789"
  location     = "global"

  principal_access_boundary_policy_id = "pde-pab-policy-nc"
  display_name = "Non-Compliant PAB Policy"

  details {
    rules {
      effect = "ALLOW"

      resources = [
        "//cloudresourcemanager.googleapis.com/projects/111",
        "//cloudresourcemanager.googleapis.com/projects/222",
        "//cloudresourcemanager.googleapis.com/projects/333",
        "//cloudresourcemanager.googleapis.com/projects/444",
        "//cloudresourcemanager.googleapis.com/projects/555",
        "//cloudresourcemanager.googleapis.com/projects/666",
        "//cloudresourcemanager.googleapis.com/projects/777"
      ]

      description = "Too many resources in one boundary rule"
    }
  }
}