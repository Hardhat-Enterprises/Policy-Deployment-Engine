resource "google_access_context_manager_service_perimeter_dry_run_ingress_policy" "non_compliant_example_1" {
  perimeter = "accessPolicies/123456/servicePerimeters/my_perimeter"

  ingress_from {
    sources {
      resource = "folders/999999999"
    }
  }
}
