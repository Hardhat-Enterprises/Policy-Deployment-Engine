resource "google_org_policy_policy" "ok" {
  name   = "projects/123456789/policies/compute.requireOsLogin"
  parent = "projects/123456789"

  spec {
    rules {
      enforce = true
    }
  }
}
