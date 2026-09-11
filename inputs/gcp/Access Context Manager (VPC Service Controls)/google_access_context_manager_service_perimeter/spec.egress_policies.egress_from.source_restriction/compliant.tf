resource "google_access_context_manager_service_perimeter" "compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "compliant_source_restriction"
  title  = "service_perimeter"

  spec {
    restricted_services = ["storage.googleapis.com"]

    egress_policies {
      egress_from {
        source_restriction = "SOURCE_RESTRICTION_ENABLED"
      }
    }
  }

  use_explicit_dry_run_spec = true
}
