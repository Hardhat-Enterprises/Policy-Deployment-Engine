# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_iam_deny_policy" "c" {
  parent   = urlencode("cloudresourcemanager.googleapis.com/projects/compliant")
  name     = "dp-c"
  display_name = "A deny rule"
  rules { # this (multiple rules available)
    description = "First rule"
    deny_rule {
      denied_principals = ["principalSet://goog/public:all"]
      denial_condition {
        title = "Some expr"
        expression = "!resource.matchTag('12345678/env', 'test')"
        description = ""
        location = ""
      }
      denied_permissions = ["cloudresourcemanager.googleapis.com/projects.update"]
      exception_permissions = [""]
      exception_principals = ["principalSet://goog/user/admin@gmail.com"]
    }
  }
}