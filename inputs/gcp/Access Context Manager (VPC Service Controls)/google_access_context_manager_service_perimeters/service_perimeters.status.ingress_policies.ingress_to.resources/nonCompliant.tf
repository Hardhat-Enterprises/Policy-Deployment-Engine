resource "google_access_context_manager_service_perimeters" "non_compliant_example_1" {
  parent = "accessPolicies/123456789"

  service_perimeters {
    name  = "accessPolicies/123456789/servicePerimeters/non_compliant_example_1"
    title = "non_compliant_example_1"

    status {
      ingress_policies {
        ingress_to {
          resources = ["*"]
        }
      }
    }
  }
}
