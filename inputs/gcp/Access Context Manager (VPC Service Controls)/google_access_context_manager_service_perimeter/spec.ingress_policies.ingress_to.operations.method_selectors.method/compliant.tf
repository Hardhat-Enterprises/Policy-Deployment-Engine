resource "google_access_context_manager_service_perimeter" "compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "compliant_ingress_method"
  title  = "compliant_ingress_method"

  spec {
    ingress_policies {
      ingress_to {
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
