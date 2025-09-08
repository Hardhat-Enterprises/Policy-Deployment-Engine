resource "google_organization_policy" "bad" {
  org_id     = "123456789012"
  constraint = "constraints/compute.disableSerialPortAccess"

  boolean_policy {
    enforced = false   # 🚨 should fail
  }
}
resource "google_organization_policy" "bad" {
  org_id     = "123456789012"
  constraint = "constraints/compute.disableSerialPortAccess"

  boolean_policy {
    enforced = false   # 🚨 should fail
  }
}
