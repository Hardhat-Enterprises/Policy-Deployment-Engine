resource "google_iam_principal_access_boundary_policy" "c" {
  organization = "123456789"
  location     = "global"

  principal_access_boundary_policy_id = "pde-pab-policy-c"
  display_name = "Compliant PAB Policy"

  details {
    rules {
      effect = "ALLOW"

      resources = [
        "//cloudresourcemanager.googleapis.com/projects/123",
        "//cloudresourcemanager.googleapis.com/projects/456",
        "//cloudresourcemanager.googleapis.com/folders/789"
      ]

      description = "Safe scoped access boundary"
    }
  }
}