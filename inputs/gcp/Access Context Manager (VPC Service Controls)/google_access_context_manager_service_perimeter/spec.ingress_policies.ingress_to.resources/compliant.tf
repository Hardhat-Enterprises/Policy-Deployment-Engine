resource "google_access_context_manager_service_perimeter" "compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "compliant_ingress_resources"
  title  = "compliant_ingress_resources"

  spec {
    ingress_policies {
      ingress_to {
        resources = ["projects/123456789"]
      }
    }
  }

  use_explicit_dry_run_spec = true
}
