resource "google_org_policy_policy" "ok" {
  name   = "projects/123456789/policies/gcp.resourceLocations"
  parent = "projects/123456789"

  spec {
    rules {
      values {
        allowed_values = ["in:us-central1", "in:us-east1"]
      }
    }
  }
}
