resource "google_access_context_manager_service_perimeter" "c" {
  name   = "accessPolicies/123456789/servicePerimeters/perimeter-ingress-c"
  parent = "accessPolicies/123456789"
  title  = "Compliant Perimeter with Ingress"

  perimeter_type = "PERIMETER_TYPE_REGULAR"

  status {
    ingress_policies {
      ingress_from {
        identities = ["user:admin@example.com"]
      }
      ingress_to {
        resources = ["projects/project-123"]
      }
    }

    restricted_services = ["storage.googleapis.com"]
  }
}
