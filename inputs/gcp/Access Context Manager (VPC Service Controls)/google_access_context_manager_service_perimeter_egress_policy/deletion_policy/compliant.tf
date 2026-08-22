resource "google_access_context_manager_service_perimeter_egress_policy" "compliant_example_1" {
  perimeter       = "accessPolicies/123456789/servicePerimeters/storage_perimeter"
  title           = "compliant_example_1"
  deletion_policy = "PREVENT"

  egress_from {
    identity_type = "ANY_SERVICE_ACCOUNT"
  }

  egress_to {
    resources = ["projects/123456789"]
  }
}
