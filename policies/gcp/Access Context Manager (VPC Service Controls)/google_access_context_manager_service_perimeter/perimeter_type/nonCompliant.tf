resource "google_access_context_manager_service_perimeter" "non_compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "non_compliant_perimeter_type"
  title  = "service_perimeter"

  perimeter_type = "PERIMETER_TYPE_BRIDGE"
}
