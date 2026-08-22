resource "google_access_context_manager_service_perimeter_egress_policy" "non_compliant_example_1" {
  perimeter = "accessPolicies/123456789/servicePerimeters/storage_perimeter"
  title     = "non_compliant_example_1"

  egress_from {
    identity_type       = "ANY_SERVICE_ACCOUNT"
    source_restriction = "SOURCE_RESTRICTION_ENABLED"

    sources {
      resource = "projects/987654321"
    }
  }

  egress_to {
    resources = ["projects/123456789"]
  }
}
