resource "google_access_context_manager_service_perimeter" "compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "compliant_status_egress_identity_type"
  title  = "compliant_status_egress_identity_type"

  status {
    egress_policies {
      egress_from {
        identity_type = "ANY_SERVICE_ACCOUNT"
      }
    }
  }
}
