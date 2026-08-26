resource "google_access_context_manager_service_perimeter" "non_compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "noncompliant_status_ingress_identities"
  title  = "noncompliant_status_ingress_identities"

  status {
    ingress_policies {
      ingress_from {
        identities = ["allUsers"]
      }
    }
  }
}
