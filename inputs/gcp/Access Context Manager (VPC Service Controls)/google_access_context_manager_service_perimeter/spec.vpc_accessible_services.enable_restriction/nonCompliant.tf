resource "google_access_context_manager_service_perimeter" "example" {
  parent = "accessPolicies/123456789"
  name   = "accessPolicies/123456789/servicePerimeters/example"
  title  = "example"

  spec {
    vpc_accessible_services {
      enable_restriction = false
    }
  }

  use_explicit_dry_run_spec = true
}
