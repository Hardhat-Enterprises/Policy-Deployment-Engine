resource "google_org_policy_policy" "c" {
  name   = "projects/123/policies/compute.requireOsLogin"
  parent = var.parent

  spec {
    rules {
      enforce = true
    }
  }
}
