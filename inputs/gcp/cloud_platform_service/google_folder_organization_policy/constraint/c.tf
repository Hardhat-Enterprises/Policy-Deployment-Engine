# Boolean policy: disable serial port access (enforced)
resource "google_folder_organization_policy" "C1" {
  folder     = "folders/123456789"
  constraint = "compute.disableSerialPortAccess"

  boolean_policy {
    enforced = true  # ✅ enforced
  }
}

# List policy: allow all services, no risky deny/allow violations
resource "google_folder_organization_policy" "C2" {
  folder     = "folders/123456789"
  constraint = "serviceuser.services"

  list_policy {
    allow {
      all = true  # ✅ allows everything safely
    }
  }
}

# Restore policy: not used (default false)
resource "google_folder_organization_policy" "C3" {
  folder     = "folders/123456789"
  constraint = "serviceuser.services"

  restore_policy {
    default = false  # ✅ safe, does not reset to default
  }
}
