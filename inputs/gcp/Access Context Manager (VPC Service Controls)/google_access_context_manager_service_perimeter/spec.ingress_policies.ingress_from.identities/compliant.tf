resource "google_access_context_manager_service_perimeter" "compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "compliant_ingress_identities"
  title  = "compliant_ingress_identities"

  spec {
    ingress_policies {
      ingress_from {
        identities = [
          "serviceAccount:app@example-project.iam.gserviceaccount.com"
        ]
      }
    }
  }

  use_explicit_dry_run_spec = true
}
