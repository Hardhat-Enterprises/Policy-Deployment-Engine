resource "google_org_policy_policy" "bad" {
  name   = "organizations/123456789/policies/compute.requireCmekForDiskCreation"
  parent = "organizations/123456789"

  boolean_policy {
    enforced = false
  }
}
