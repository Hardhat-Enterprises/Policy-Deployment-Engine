resource "google_access_context_manager_service_perimeter" "non_compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "noncompliant_ingress_access_level"
  title  = "noncompliant_ingress_access_level"

  spec {
    ingress_policies {
      ingress_from {
        sources {
          access_level = "*"
        }
      }
    }
  }

  use_explicit_dry_run_spec = true
}
