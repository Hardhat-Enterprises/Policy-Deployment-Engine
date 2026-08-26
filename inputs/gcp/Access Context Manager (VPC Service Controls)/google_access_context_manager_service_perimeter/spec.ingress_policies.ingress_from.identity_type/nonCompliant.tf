resource "google_access_context_manager_service_perimeter" "non_compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "noncompliant_ingress_identity_type"
  title  = "noncompliant_ingress_identity_type"

  spec {
    ingress_policies {
      ingress_from {
        identity_type = "ANY_IDENTITY"
      }
    }
  }

  use_explicit_dry_run_spec = true
}
