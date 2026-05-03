resource "google_iam_access_boundary_policy" "nc" {
  parent       = "cloudresourcemanager.googleapis.com/projects/my-project"
  name         = "test1234ab-policy"
  display_name = "Bad AB policy"

  rules {
    description = "AB rule"

    access_boundary_rule {
      available_resource    = "*"
      available_permissions = ["*"]

      availability_condition {
        title      = "Access level expr"
        expression = "true"
      }
    }
  }
}