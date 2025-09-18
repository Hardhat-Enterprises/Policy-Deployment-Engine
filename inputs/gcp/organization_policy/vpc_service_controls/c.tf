resource "google_org_policy_policy" "ok" {
  name   = "organizations/123456789/policies/gcp.vpcServiceControls"
  parent = "organizations/123456789"

  # representation may vary by provider version; using spec.rules here
  spec {
    rules {
      values {
        allowed_values = ["inVpcServiceControls"]
      }
    }
  }
}
