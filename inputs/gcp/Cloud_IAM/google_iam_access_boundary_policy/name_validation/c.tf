 
resource "google_iam_access_boundary_policy" "c" {

  parent       = urlencode("cloudresourcemanager.googleapis.com/projects/my-project")
  name         = "pde-secure-boundary-01"
  display_name = "c"

  rules {
    description = "Secure rule"

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

