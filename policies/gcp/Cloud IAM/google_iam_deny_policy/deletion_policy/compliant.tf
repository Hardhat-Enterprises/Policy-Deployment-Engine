resource "google_iam_deny_policy" "compliant_example_1" {
  parent          = "cloudresourcemanager.googleapis.com/projects/example-project"
  name            = "deny-policy-good"
  display_name    = "Example deny policy"
  deletion_policy = "PREVENT"

  rules {
    description = "Example deny rule"

    deny_rule {
      denied_permissions = [
        "iam.googleapis.com/roles.delete"
      ]

      denied_principals = [
        "principalSet://goog/public:all"
      ]
    }
  }
}
