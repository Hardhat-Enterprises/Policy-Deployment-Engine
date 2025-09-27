resource "google_org_policy_policy" "c" {
  name   = "projects/123/policies/accessPolicies.restrictVpcServiceControls"
  parent = var.parent

  spec {
    rules {
      enforce = true
    }
  }
}
