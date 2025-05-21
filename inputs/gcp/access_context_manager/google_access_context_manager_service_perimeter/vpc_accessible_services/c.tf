resource "google_access_context_manager_service_perimeter" "c" {
  name           = "accessPolicies/1234567890/servicePerimeters/perimeter-secure"
  parent         = "accessPolicies/1234567890"
  title          = "Perimeter Secure"
  perimeter_type = "PERIMETER_TYPE_REGULAR"

  status {
    resources = [] 

    vpc_accessible_services {
      enable_restriction = true
      allowed_services   = [
        "bigquery.googleapis.com",
        "storage.googleapis.com"
      ]
    }
  }
}
