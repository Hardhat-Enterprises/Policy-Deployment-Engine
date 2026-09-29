resource "google_access_context_manager_service_perimeter_dry_run_ingress_policy" "compliant_example_1" {
  perimeter = "accessPolicies/123456789/servicePerimeters/my_perimeter"

  ingress_from {
    identities = [
      "serviceAccount:app@example-project.iam.gserviceaccount.com"
    ]
  }
}
