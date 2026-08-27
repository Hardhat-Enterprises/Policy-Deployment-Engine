resource "google_access_context_manager_service_perimeter" "non_compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "accessPolicies/123456789/servicePerimeters/noncompliant_enable_restriction"
  title  = "noncompliant_enable_restriction"

  spec {
    restricted_services = ["storage.googleapis.com"]

    vpc_accessible_services {
      enable_restriction = false
    }
  }

  use_explicit_dry_run_spec = true
}
