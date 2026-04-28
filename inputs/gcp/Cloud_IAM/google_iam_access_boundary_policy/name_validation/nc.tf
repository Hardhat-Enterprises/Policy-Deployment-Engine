resource "google_iam_access_boundary_policy" "nc" {
  name   = "my-ab-policy"          
  parent = "cloudresourcemanager.googleapis.com/projects/my-project-id"
  display_name = "My AB policy"
  rules {
    description = "AB rule"
    access_boundary_rule {
      availability_condition {
        title      = "Access level expr"
        expression = "request.matchAccessLevels('123456789', ['accessPolicies/123/accessLevels/chromeos_no_lock'])"
      }
    }
  }
}