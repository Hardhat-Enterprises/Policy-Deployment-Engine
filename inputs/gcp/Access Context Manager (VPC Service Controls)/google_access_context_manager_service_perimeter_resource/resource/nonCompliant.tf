resource "google_access_context_manager_service_perimeter_resource" "non_compliant_example_1" {
  perimeter_name = "accessPolicies/123456/servicePerimeters/my_perimeter"
  resource       = "projects/999999999"
}
