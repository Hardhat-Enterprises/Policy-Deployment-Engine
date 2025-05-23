
# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_iam_deny_policy" "nc" {
  parent   = urlencode("cloudresourcemanager.googleapis.com/projects/compliant")
  name     = "dp-nc"
  display_name = "A deny rule"
  rules { # this (multiple rules available)
    description = "First rule"
    deny_rule {
      denied_principals = [""]
      denial_condition {
        title = "Some expr"
        expression = "!resource.matchTag('12345678/env', 'test')"
        description = ""
        location = ""
      }
      denied_permissions = [""]
      exception_permissions = [""]
      exception_principals = [""]
    }
  }
}
