resource "google_access_context_manager_service_perimeter" "compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "compliant_ingress_access_level"
  title  = "compliant_ingress_access_level"

  spec {
    restricted_services = ["storage.googleapis.com"]

    ingress_policies {
      ingress_from {
        sources {
          access_level = "accessPolicies/123456789/accessLevels/restricted_access"
        }
      }
    }
  }

  use_explicit_dry_run_spec = true
}
