resource "google_org_policy_policy" "nc" {
  name   = "projects/123/policies/iam.disableServiceAccountKeyCreation"
  parent = var.parent

  spec {
    rules {
      enforce = false
    }
  }
}
