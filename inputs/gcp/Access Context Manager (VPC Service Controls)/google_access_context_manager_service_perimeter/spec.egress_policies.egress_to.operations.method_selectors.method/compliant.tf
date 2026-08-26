resource "google_access_context_manager_service_perimeter" "compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "compliant_egress_method"
  title  = "compliant_egress_method"

  spec {
    restricted_services = ["storage.googleapis.com"]

    egress_policies {
      egress_to {
        operations {
          service_name = "storage.googleapis.com"

          method_selectors {
            method = "google.storage.objects.get"
          }
        }
      }
    }
  }

  use_explicit_dry_run_spec = true
}
