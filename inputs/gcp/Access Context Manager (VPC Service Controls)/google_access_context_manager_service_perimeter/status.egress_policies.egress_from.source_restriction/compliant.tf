resource "google_access_context_manager_service_perimeter" "compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "accessPolicies/123456789/servicePerimeters/compliant_status_egress_source_restriction"
  title  = "compliant_status_egress_source_restriction"

  status {
    restricted_services = ["storage.googleapis.com"]

    egress_policies {
      egress_from {
        source_restriction = "SOURCE_RESTRICTION_ENABLED"
      }
    }
  }
}
