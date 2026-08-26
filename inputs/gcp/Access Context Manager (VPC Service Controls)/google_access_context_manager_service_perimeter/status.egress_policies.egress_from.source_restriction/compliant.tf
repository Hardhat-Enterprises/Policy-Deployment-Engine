resource "google_access_context_manager_service_perimeter" "compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "compliant_status_egress_source_restriction"
  title  = "compliant_status_egress_source_restriction"

  status {
    egress_policies {
      egress_from {
        source_restriction = "SOURCE_RESTRICTION_ENABLED"
      }
    }
  }
}
