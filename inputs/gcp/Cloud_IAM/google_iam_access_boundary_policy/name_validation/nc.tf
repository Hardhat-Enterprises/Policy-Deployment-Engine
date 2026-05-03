resource "google_iam_access_boundary_policy" "nc" {

  parent       = "cloudresourcemanager.googleapis.com/projects/my-project"
  name         = "temp-policy"  
  display_name = "Bad Policy"

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