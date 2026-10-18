resource "google_access_context_manager_service_perimeter" "non_compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "non_compliant_ingress_method"
  title  = "service_perimeter"

  spec {
    restricted_services = ["storage.googleapis.com"]

    ingress_policies {
      ingress_to {
        operations {
          service_name = "storage.googleapis.com"

          method_selectors {
            method = "*"
          }
        }
      }
    }
  }

  use_explicit_dry_run_spec = true
}
