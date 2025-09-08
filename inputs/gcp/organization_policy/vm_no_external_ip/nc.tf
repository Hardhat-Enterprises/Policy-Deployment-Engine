resource "google_org_policy_policy" "bad" {
  name   = "projects/123456789/policies/compute.vmExternalIpAccess"
  parent = "projects/123456789"

  spec {
    rules {
      deny_all = false
    }
  }
}

