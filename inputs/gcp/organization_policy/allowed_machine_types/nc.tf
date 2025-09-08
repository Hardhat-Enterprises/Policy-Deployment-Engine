resource "google_org_policy_policy" "bad" {
  name   = "projects/123456789/policies/compute.allowedMachineTypes"
  parent = "projects/123456789"

  spec {
    rules {
      values {
        allowed_values = ["n1-ultramem-160"] # 🚨 disallowed
      }
    }
  }
}
