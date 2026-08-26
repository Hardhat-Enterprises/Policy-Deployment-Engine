resource "google_access_context_manager_service_perimeter" "compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "compliant_perimeter_type"
  title  = "regular_perimeter"

  perimeter_type = "PERIMETER_TYPE_REGULAR"
}
