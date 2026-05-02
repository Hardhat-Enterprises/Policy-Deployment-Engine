resource "google_iam_access_boundary_policy" "c" {
  parent       = urlencode("cloudresourcemanager.googleapis.com/projects/my-gcp-project")
  name         = "my-ab-policy"
  display_name = "My Compliant AB policy"
  
  rules {
    description = "AB rule"
    access_boundary_rule {
      available_resource    = "*"
      available_permissions = ["*"]
      
      availability_condition {
        title      = "Access level expr"
        expression = "request.matchAccessLevels('123456789', ['accessPolicies/123/accessLevels/chromeos_no_lock'])"
      }
    }
  }
}