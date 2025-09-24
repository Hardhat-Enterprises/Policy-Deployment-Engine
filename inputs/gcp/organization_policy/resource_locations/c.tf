resource "google_org_policy_policy" "c" {
  name   = "projects/123/policies/gcp.resourceLocations"
  parent = var.parent

  spec {
    rules {
      values {
        allowed_values = ["us-central1", "us-east1"]
      }
    }
  }
}
