resource "google_access_context_manager_service_perimeter" "non_compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "compliant_egress_permission"
  title  = "service_perimeter"

  spec {
    restricted_services = ["storage.googleapis.com"]

    egress_policies {
      egress_to {
        operations {
          service_name = "storage.googleapis.com"

          method_selectors {
            permission = "*"
          }
        }
      }
    }
  }

  use_explicit_dry_run_spec = true
}
