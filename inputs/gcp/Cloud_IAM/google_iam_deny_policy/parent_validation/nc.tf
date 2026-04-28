resource "google_iam_deny_policy" "nc" {
  name   = "pde-deny-policy"
  parent = "projects/my-project-id"  # Invalid format

  display_name = "PDE Deny Policy"

  rules {
    description = "Prevent unauthorized project updates"

    deny_rule {
      denied_principals  = ["principalSet://goog/public:all"]
      denied_permissions = ["cloudresourcemanager.googleapis.com/projects.update"]

      denial_condition {
        title      = "Only allow test environments"
        expression = "!resource.matchTag('project/env', 'production')"
      }
    }
  }
}