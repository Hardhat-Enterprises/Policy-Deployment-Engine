resource "google_iam_deny_policy" "nc1" {
  name   = "nc1"
  parent = "cloudresourcemanager.googleapis.com/projects/my-project"

  rules {
    deny_rule {
      denied_permissions = [
        "resourcemanager.projects.delete"
      ]

      denied_principals = [
        "principal://goog/subject/user@example.com"
      ]
    }
  }
}