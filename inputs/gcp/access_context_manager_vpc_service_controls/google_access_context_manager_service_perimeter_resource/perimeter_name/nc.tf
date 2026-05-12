resource "google_access_context_manager_service_perimeter_resource" "c" {
  perimeter_name = "accessPolicies/123456/servicePerimeters/WRONG_PERIMETER"
  resource       = "projects/123456789"
}