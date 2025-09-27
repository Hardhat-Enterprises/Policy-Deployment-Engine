resource "google_org_policy_policy" "nc" {
  name   = "projects/123/policies/gcp.resourceLocations"
  parent = var.parent

  spec {
    rules {
      values {
        allowed_values = ["europe-west1"]
      }
    }
  }
}
