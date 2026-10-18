resource "google_access_context_manager_service_perimeter" "compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "accessPolicies/123456789/servicePerimeters/compliant_status_egress_identities"
  title  = "service_perimeter"

  status {
    restricted_services = ["storage.googleapis.com"]

    egress_policies {
      egress_from {
        identity_type = "ANY_SERVICE_ACCOUNT"

        identities = [
          "serviceAccount:approved@example-project.iam.gserviceaccount.com"
        ]
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
