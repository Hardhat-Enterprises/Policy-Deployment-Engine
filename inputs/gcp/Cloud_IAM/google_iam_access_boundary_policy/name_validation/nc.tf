resource "google_iam_access_boundary_policy" "nc" {
  parent       = urlencode("cloudresourcemanager.googleapis.com/projects/my-project")
  name         = "pde-test-policy"
  display_name = "nc"

  rules {
    description = "Weak rule"

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