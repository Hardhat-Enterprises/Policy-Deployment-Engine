resource "google_org_policy_policy" "ok" {
  name   = "organizations/123456789/policies/compute.disableNestedVirtualization"
  parent = "organizations/123456789"

  spec {
    rules {
      enforce = true
    }
  }
}
