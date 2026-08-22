resource "google_access_context_manager_service_perimeter_egress_policy" "non_compliant_example_1" {
  perimeter = "accessPolicies/123456/servicePerimeters/my_perimeter"
  title     = "allow-all-egress-resources"

  egress_from {
    identity_type = "ANY_SERVICE_ACCOUNT"
  }

  egress_to {
    resources = ["*"]
  }
}
