resource "google_org_policy_policy" "nc" {
  name   = "projects/123/policies/compute.allowedMachineTypes"
  parent = var.parent

  spec {
    rules {
      values {
        allowed_values = ["n2-standard-16"] 
      }
    }
  }
}
