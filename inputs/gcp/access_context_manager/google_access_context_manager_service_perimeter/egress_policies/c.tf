resource "google_access_context_manager_service_perimeter" "c" {
  name   = "accessPolicies/123456789/servicePerimeters/perimeter1"
  parent = "accessPolicies/123456789"
  title  = "Compliant Perimeter"

  perimeter_type = "PERIMETER_TYPE_REGULAR"

  status {
    egress_policies {
      egress_from {
        identities = ["user:alice@example.com"]
      }
      egress_to {
        resources = ["projects/123456"]
      }
    }

    restricted_services = ["storage.googleapis.com"]
  }
}
