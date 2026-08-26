resource "google_access_context_manager_service_perimeter" "compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "compliant_allowed_services"
  title  = "compliant_allowed_services"

  spec {
    vpc_accessible_services {
      enable_restriction = true
      allowed_services   = ["storage.googleapis.com"]
    }
  }

  use_explicit_dry_run_spec = true
}
