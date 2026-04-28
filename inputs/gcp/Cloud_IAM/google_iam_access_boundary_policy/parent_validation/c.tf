resource "google_iam_access_boundary_policy" "c" {
  name         = "valid-policy-name"
  parent       = "cloudresourcemanager.googleapis.com/projects/123456789"
  display_name = "Valid AB policy"

  rules {
    description = "Valid rule"

    access_boundary_rule {
      availability_condition {
        title      = "Access level expr"
        expression = "true"
      }
    }
  }
}