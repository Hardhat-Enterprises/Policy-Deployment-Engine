resource "google_access_context_manager_service_perimeter_dry_run_egress_policy" "non_compliant_example_1" {
  perimeter = "accessPolicies/123456/servicePerimeters/my_perimeter"
  title     = "allow-unapproved-egress-identity"

  egress_from {
    identities = ["user:external-user@example.com"]
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
