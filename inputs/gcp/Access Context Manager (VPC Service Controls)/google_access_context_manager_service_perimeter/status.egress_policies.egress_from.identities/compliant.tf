resource "google_access_context_manager_service_perimeter" "compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "compliant_status_egress_identities"
  title  = "compliant_status_egress_identities"

  status {
    egress_policies {
      egress_from {
        identities = [
          "serviceAccount:approved@example-project.iam.gserviceaccount.com"
        ]
      }
    }
  }
}
