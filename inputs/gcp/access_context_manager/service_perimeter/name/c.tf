# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_access_context_manager_service_perimeter" "c" {
  name           = "accessPolicies/1234567890/servicePerimeters/perimeter-secure"
  perimeter_type = "PERIMETER_TYPE_REGULAR"
  parent         = "accessPolicies/1234567890"
  title          = "Valid Name Perimeter"
}
