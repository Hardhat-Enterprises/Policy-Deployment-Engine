# Boolean policy: insecure because not enforced
resource "google_folder_organization_policy" "NC1" {
  folder     = "folders/9787987"
  constraint = "compute.disableSerialPortAccess"

  boolean_policy {
    enforced = false  # ❌ should be true
  }
}

# List policy: insecure because denies risky service
resource "google_folder_organization_policy" "NC2" {
  folder     = "folders/098765432"
  constraint = "serviceuser.services"

  list_policy {
    deny {
      values = ["cloudresourcemanager.googleapis.com"]  # ❌ blacklisted in policy
    }
  }
}

# Restore policy: insecure because resets to default
resource "google_folder_organization_policy" "NC3" {
  folder     = "folders/123456789"
  constraint = "serviceuser.services"

  restore_policy {
    default = true  # ❌ disallowed
  }
}

resource "google_folder_organization_policy" "NC4" {
  folder     = "folders/8383838"
  constraint = "serviceuser.services"

  list_policy {
    inherit_from_parent = true  # ❌ should be false or omitted
    allow {
      all = true
    }
  }
}

