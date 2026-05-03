resource "google_iam_access_boundary_policy" "c" {
  parent       = "cloudresourcemanager.googleapis.com/projects/my-project"
  name         = "pde-ab-policy"
  display_name = "PDE Access Boundary Policy"

  rules {
    description = "AB rule"
    access_boundary_rule {
      available_resource    = "*"
      available_permissions = ["*"]

      availability_condition {
        title      = "PDE condition"
        expression = "true"
      }
    }
  }
}