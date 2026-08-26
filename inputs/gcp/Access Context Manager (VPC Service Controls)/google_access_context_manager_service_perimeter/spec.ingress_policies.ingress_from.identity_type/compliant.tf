resource "google_access_context_manager_service_perimeter" "compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "compliant_ingress_identity_type"
  title  = "compliant_ingress_identity_type"

  spec {
    restricted_services = ["storage.googleapis.com"]

    ingress_policies {
      ingress_from {
        identity_type = "ANY_SERVICE_ACCOUNT"
      }
    }
  }

  use_explicit_dry_run_spec = true
}
