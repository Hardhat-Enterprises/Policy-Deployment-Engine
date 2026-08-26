resource "google_access_context_manager_service_perimeter" "non_compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "noncompliant_status_egress_source_restriction"
  title  = "noncompliant_status_egress_source_restriction"

  status {
    egress_policies {
      egress_from {
        source_restriction = "SOURCE_RESTRICTION_DISABLED"
      }
    }
  }
}
