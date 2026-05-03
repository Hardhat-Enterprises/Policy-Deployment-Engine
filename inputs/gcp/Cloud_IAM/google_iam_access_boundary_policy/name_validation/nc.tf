resource "google_iam_access_boundary_policy" "nc" {
  parent       = "cloudresourcemanager.googleapis.com/projects/my-project"
  name         = "test-ab-policy"   
  display_name = "Bad AB Policy"

  rules {
    access_boundary_rule {
      available_resource    = "*"
      available_permissions = ["*"]

      availability_condition {
        title      = "test condition"
        expression = "true"
      }
    }
  }
}