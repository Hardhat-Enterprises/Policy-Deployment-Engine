resource "google_access_context_manager_service_perimeter_egress_policy" "non_compliant_example_1" {
  perimeter = "accessPolicies/123456/servicePerimeters/my_perimeter"
  title = "non_compliant_example_1"

  egress_from {
    identity_type = "ANY_SERVICE_ACCOUNT"
  }

  egress_to {
    resources = ["projects/example-project-number"]

    operations {
      service_name = "bigquery.googleapis.com"

      method_selectors {
        method = "*"
      }
    }
  }
}
