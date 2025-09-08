resource "google_org_policy_policy" "bad" {
  name   = "projects/123456789/policies/gcp.resourceLocations"
  parent = "projects/123456789"

  spec {
    rules {
      values {
        allowed_values = ["in:asia-southeast1"] # 🚨 not allowed
      }
    }
  }
}
