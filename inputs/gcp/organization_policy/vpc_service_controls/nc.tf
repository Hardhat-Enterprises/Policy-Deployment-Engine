resource "google_org_policy_policy" "bad" {
  name   = "organizations/123456789/policies/gcp.vpcServiceControls"
  parent = "organizations/123456789"

  # not restricting to VPC-SC
  spec {
    rules {
      values {
        allowed_values = ["anyLocation"]
      }
    }
  }
}
