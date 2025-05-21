resource "google_access_context_manager_service_perimeter" "nc" {
  name           = "accessPolicies/1234567890/servicePerimeters/perimeter-insecure"
  parent         = "accessPolicies/1234567890"
  title          = "Perimeter Insecure"
  perimeter_type = "PERIMETER_TYPE_REGULAR"

  status {
    resources = [] 

    vpc_accessible_services {
      enable_restriction = false
      allowed_services   = []
    }
  }
}