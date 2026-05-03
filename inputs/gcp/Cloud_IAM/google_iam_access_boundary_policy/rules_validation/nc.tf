resource "google_iam_access_boundary_policy" "nc" {
  parent       = "cloudresourcemanager.googleapis.com/projects/my-project"
  name         = "my-ab-policy"
  display_name = "AB Policy"

  rules {
    description = "rule 1"
    access_boundary_rule {
      available_resource    = "*"
      available_permissions = ["*"]

      availability_condition {
        title      = "c1"
        expression = "true"
      }
    }
  }

  rules {
    description = "rule 2"
    access_boundary_rule {
      available_resource    = "*"
      available_permissions = ["*"]

      availability_condition {
        title      = "c2"
        expression = "true"
      }
    }
  }

  rules {
    description = "rule 3"
    access_boundary_rule {
      available_resource    = "*"
      available_permissions = ["*"]

      availability_condition {
        title      = "c3"
        expression = "true"
      }
    }
  }

  rules {
    description = "rule 4"  
    access_boundary_rule {
      available_resource    = "*"
      available_permissions = ["*"]

      availability_condition {
        title      = "c4"
        expression = "true"
      }
    }
  }
}