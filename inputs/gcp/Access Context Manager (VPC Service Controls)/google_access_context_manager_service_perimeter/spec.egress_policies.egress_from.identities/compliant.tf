resource "google_access_context_manager_service_perimeter" "compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "compliant_egress_identities"
  title  = "compliant_egress_identities"

  spec {
    restricted_services = ["storage.googleapis.com"]

    egress_policies {
      egress_from {
        identities = ["serviceAccount:approved@example.iam.gserviceaccount.com"]
      }
    }
  }

  use_explicit_dry_run_spec = true
}
