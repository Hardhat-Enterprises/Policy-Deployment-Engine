resource "google_access_context_manager_service_perimeter" "compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "compliant_ingress_permission"
  title  = "compliant_ingress_permission"

  spec {
    restricted_services = ["storage.googleapis.com"]

    ingress_policies {
      ingress_to {
        operations {
          service_name = "storage.googleapis.com"

          method_selectors {
            permission = "storage.objects.get"
          }
        }
      }
    }
  }

  use_explicit_dry_run_spec = true
}
