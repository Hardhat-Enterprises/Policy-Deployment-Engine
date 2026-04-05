resource "google_iam_deny_policy" "nc" {
  name   = "deny-policy"   
  parent = "cloudresourcemanager.googleapis.com/projects/my-project-id"

  display_name = "Deny policy"

  rules {
    description = "Deny rule"

    deny_rule {
      denied_principals = ["principal://goog/subject/user@example.com"]

      denied_permissions = [
        "cloudresourcemanager.googleapis.com/projects.update"
      ]

      denial_condition {
        title      = "Condition"
        expression = "true"
      }
    }
  }
}