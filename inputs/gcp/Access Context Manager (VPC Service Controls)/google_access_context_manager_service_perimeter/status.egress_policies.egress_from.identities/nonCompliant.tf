resource "google_access_context_manager_service_perimeter" "non_compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "accessPolicies/123456789/servicePerimeters/non_compliant_status_egress_identities"
  title  = "service_perimeter"

  status {
    restricted_services = ["storage.googleapis.com"]

    egress_policies {
      egress_from {
        identity_type = "ANY_SERVICE_ACCOUNT"
        identities    = ["*"]
      }

      egress_to {
        resources = ["projects/123456789"]

        operations {
          service_name = "storage.googleapis.com"
        }
      }
    }
  }
}
