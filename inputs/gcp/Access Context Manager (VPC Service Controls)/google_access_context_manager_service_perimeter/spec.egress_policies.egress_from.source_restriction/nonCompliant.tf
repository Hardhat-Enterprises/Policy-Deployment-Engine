resource "google_access_context_manager_service_perimeter" "non_compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "noncompliant_source_restriction"
  title  = "noncompliant_source_restriction"

  spec {
    egress_policies {
      egress_from {
        source_restriction = "SOURCE_RESTRICTION_DISABLED"
      }
    }
  }

  use_explicit_dry_run_spec = true
}
