resource "google_access_context_manager_service_perimeter_dry_run_egress_policy" "compliant_example_1" {
  perimeter = "accessPolicies/123456/servicePerimeters/my_perimeter"
  title     = "allow-approved-egress-resource"

  egress_from {
    identity_type = "ANY_SERVICE_ACCOUNT"
  }

  egress_to {
    resources = ["projects/123456789"]
  }
}
