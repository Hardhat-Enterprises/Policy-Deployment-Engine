resource "google_access_context_manager_service_perimeters" "compliant_example_1" {
  parent = "accessPolicies/123456789"

  service_perimeters {
    name  = "accessPolicies/123456789/servicePerimeters/compliant_example_1"
    title = "compliant_example_1"

    status {
      ingress_policies {
        ingress_from {
          sources {
            resource = "projects/123456789"
          }
        }
      }
    }
  }
}
