resource "google_iam_access_boundary_policy" "c" {

  parent       = "cloudresourcemanager.googleapis.com/projects/my-project"
  name         = "pde-secure-boundary-01"
  display_name = "Production Policy"

  rules {
    access_boundary_rule {
      available_resource    = "*"
      available_permissions = ["*"]

      availability_condition {
        title      = "condition"
        expression = "true"
      }
    }
  }
}