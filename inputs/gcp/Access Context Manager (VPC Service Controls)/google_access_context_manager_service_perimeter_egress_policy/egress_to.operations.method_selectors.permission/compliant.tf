resource "google_access_context_manager_service_perimeter_egress_policy" "compliant_example_1" {
  perimeter = "accessPolicies/123456/servicePerimeters/my_perimeter"
  title     = "allow-approved-egress-permission"

  egress_from {
    identity_type = "ANY_SERVICE_ACCOUNT"
  }

  egress_to {
    resources = ["projects/123456789"]

    operations {
      service_name = "bigquery.googleapis.com"

      method_selectors {
        permission = "bigquery.tables.get"
      }
    }
  }
}
