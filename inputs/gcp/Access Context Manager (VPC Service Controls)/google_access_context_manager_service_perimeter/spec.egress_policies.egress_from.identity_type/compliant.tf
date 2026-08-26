resource "google_access_context_manager_service_perimeter" "compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "compliant_egress_identity_type"
  title  = "compliant_egress_identity_type"

  spec {
    egress_policies {
      egress_from {
        identity_type = "ANY_SERVICE_ACCOUNT"
      }
    }
  }

  use_explicit_dry_run_spec = true
}
