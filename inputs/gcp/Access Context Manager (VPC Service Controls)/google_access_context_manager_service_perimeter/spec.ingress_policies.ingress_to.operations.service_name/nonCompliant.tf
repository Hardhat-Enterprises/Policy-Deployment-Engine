resource "google_access_context_manager_service_perimeter" "non_compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "compliant_ingress_service_name"
  title  = "service_perimeter"

  spec {
    restricted_services = ["storage.googleapis.com"]

    ingress_policies {
      ingress_to {
        operations {
          service_name = "*"
        }
      }
    }
  }

  use_explicit_dry_run_spec = true
}
