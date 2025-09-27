resource "google_org_policy_policy" "c" {
  name   = "projects/123/policies/compute.allowedMachineTypes"
  parent = var.parent

  spec {
    rules {
      values {
        allowed_values = ["n1-standard-4", "e2-medium"] 
      }
    }
  }
}