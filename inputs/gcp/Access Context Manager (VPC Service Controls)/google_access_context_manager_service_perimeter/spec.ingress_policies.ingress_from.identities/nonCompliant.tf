resource "google_access_context_manager_service_perimeter" "non_compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "noncompliant_ingress_identities"
  title  = "noncompliant_ingress_identities"

  spec {
    restricted_services = ["storage.googleapis.com"]

    ingress_policies {
      ingress_from {
        identities = [
          "allUsers"
        ]
      }
    }
  }

  use_explicit_dry_run_spec = true
}
