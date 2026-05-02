resource "google_iam_access_boundary_policy" "nc" {
  name         = ""  
  parent       = "invalid-parent"    
  display_name = "Invalid parent policy"

  rules {
    description = "Invalid rule"

    access_boundary_rule {
      availability_condition {
        title      = "Bad expr"
        expression = "false"
      }
    }
  }
}