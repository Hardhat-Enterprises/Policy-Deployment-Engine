resource "google_org_policy_policy" "ok" {
  name   = "organizations/123456789/policies/compute.requireCmekForDiskCreation"
  parent = "organizations/123456789"

  boolean_policy {
    enforced = true
  }
}
