resource "google_iam_access_boundary_policy" "c" {
  parent       = "cloudresourcemanager.googleapis.com/projects/my-project"
  name         = "pde-ab-policy"
  display_name = "My AB policy"

  rules {
    description = "AB rule"

    access_boundary_rule {
      available_resource    = "*"
      available_permissions = ["*"]

      availability_condition {
        title       = "Access level expr"
        expression  = "true"
      }
    }
  }
}