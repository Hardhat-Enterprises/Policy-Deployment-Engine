resource "google_access_context_manager_service_perimeter" "non_compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "noncompliant_ingress_resources"
  title  = "noncompliant_ingress_resources"

  spec {
    ingress_policies {
      ingress_to {
        resources = ["*"]
      }
    }
  }

  use_explicit_dry_run_spec = true
}
