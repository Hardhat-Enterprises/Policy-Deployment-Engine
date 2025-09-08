resource "google_org_policy_policy" "ok" {
  name   = "projects/123456789/policies/compute.allowedMachineTypes"
  parent = "projects/123456789"

  spec {
    rules {
      values {
        allowed_values = ["n1-standard-1", "n1-standard-2"]
      }
    }
  }
}
