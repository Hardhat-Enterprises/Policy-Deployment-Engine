resource "google_access_context_manager_service_perimeter" "compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "accessPolicies/123456789/servicePerimeters/compliant_enable_restriction"
  title  = "service_perimeter"

  spec {
    restricted_services = ["storage.googleapis.com"]

    vpc_accessible_services {
      enable_restriction = true
    }
  }

  use_explicit_dry_run_spec = true
}
