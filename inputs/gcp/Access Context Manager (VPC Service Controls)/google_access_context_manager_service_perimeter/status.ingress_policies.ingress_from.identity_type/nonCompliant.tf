resource "google_access_context_manager_service_perimeter" "non_compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "accessPolicies/123456789/servicePerimeters/compliant_status_ingress_identity_type"
  title  = "service_perimeter"

  status {
    restricted_services = ["storage.googleapis.com"]

    ingress_policies {
      ingress_from {
        identity_type = "ANY_IDENTITY"
      }
    }
  }
}
