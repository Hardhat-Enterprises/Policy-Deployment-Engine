# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_access_context_manager_service_perimeter" "nc" {
  parent         = "accessPolicies/1234567890"
  title          = "Perimeter Insecure"
  perimeter_type = "PERIMETER_TYPE_REGULAR"
  name           = "accessPolicies/1234567890/servicePerimeters/perimeter-insecure"

  status {
    resources = [
      "projects/test-project"
    ]
  }
}