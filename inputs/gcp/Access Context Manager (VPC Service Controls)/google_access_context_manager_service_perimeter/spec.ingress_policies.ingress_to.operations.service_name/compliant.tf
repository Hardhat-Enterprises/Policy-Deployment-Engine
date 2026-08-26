resource "google_access_context_manager_service_perimeter" "compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "compliant_ingress_service_name"
  title  = "compliant_ingress_service_name"

  spec {
    ingress_policies {
      ingress_to {
        operations {
          service_name = "storage.googleapis.com"
        }
      }
    }
  }

  use_explicit_dry_run_spec = true
}
