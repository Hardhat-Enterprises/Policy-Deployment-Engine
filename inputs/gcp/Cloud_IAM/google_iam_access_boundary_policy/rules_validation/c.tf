resource "google_iam_access_boundary_policy" "c" {
  parent       = "cloudresourcemanager.googleapis.com/projects/my-project"
  name         = "my-ab-policy"
  display_name = "AB Policy"

  rules {
    description = "rule 1"
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