resource "google_folder_organization_policy" "compliant_example_1" {
  folder     = "folders/123456789"
  constraint = "compute.disableSerialPortAccess"

  boolean_policy {
    enforced = true 
  }
}
resource "google_folder_organization_policy" "compliant_example_2" {
  folder     = "folders/123456789"
  constraint = "serviceuser.services"

  list_policy {
    allow {
      all = true
    }
  }
}

resource "google_folder_organization_policy" "compliant_example_3" {
  folder     = "folders/123456789"
  constraint = "serviceuser.services"

  restore_policy {
    default = false 
  }
}
