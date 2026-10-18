resource "google_access_context_manager_service_perimeter" "non_compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "non_compliant_allowed_services"
  title  = "service_perimeter"

  spec {
    restricted_services = ["storage.googleapis.com"]

    vpc_accessible_services {
      enable_restriction = true
      allowed_services   = ["*"]
    }
  }

  use_explicit_dry_run_spec = true
}
