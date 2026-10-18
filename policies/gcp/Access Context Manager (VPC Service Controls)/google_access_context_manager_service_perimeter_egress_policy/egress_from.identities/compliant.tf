resource "google_access_context_manager_service_perimeter_egress_policy" "compliant_example_1" {
  perimeter = "accessPolicies/123456/servicePerimeters/my_perimeter"
  title = "compliant_example_1"

  egress_from {
    identities = ["serviceAccount:service-123456789@example-project.iam.gserviceaccount.com"]
  }

  egress_to {
    resources = ["projects/example-project-number"]

    operations {
      service_name = "bigquery.googleapis.com"

      method_selectors {
        permission = "bigquery.tables.get"
      }
    }
  }
}
