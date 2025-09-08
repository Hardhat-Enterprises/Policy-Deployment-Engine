resource "google_org_policy_policy" "bad" {
  name   = "projects/123456789/policies/iam.disableServiceAccountKeyCreation"
  parent = "projects/123456789"

  spec {
    rules {
      enforce = false
    }
  }
}

