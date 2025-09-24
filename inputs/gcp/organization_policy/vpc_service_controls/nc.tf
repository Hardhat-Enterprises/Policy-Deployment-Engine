resource "google_org_policy_policy" "nc" {
  name   = "projects/123/policies/accessPolicies.restrictVpcServiceControls"
  parent = var.parent

  spec {
    rules {
      enforce = false
    }
  }
}
