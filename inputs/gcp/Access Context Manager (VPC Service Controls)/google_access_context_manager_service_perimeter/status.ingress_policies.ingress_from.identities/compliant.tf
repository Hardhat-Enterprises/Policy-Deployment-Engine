resource "google_access_context_manager_service_perimeter" "compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "compliant_status_ingress_identities"
  title  = "compliant_status_ingress_identities"

  status {
    ingress_policies {
      ingress_from {
        identities = [
          "serviceAccount:approved@example-project.iam.gserviceaccount.com"
        ]
      }
    }
  }
}
