resource "google_folder_organization_policy" "non_compliant_example_1" {
  folder     = "folders/098765432"
  constraint = "serviceuser.services"

  list_policy {
    deny {
      values = ["cloudresourcemanager.googleapis.com"]  
    }
  }
}

resource "google_folder_organization_policy" "non_compliant_example_2" {
  folder     = "folders/123456789"
  constraint = "serviceuser.services"

  restore_policy {
    default = true 
  }
}
resource "google_folder_organization_policy" "non_compliant_example_3" {
  folder     = "folders/8383838"
  constraint = "serviceuser.services"

  list_policy {
    inherit_from_parent = true  
    allow {
      all = true
    }
  }
}

