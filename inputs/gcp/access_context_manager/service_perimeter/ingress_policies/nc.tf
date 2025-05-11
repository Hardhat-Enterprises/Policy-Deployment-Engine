# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_access_context_manager_service_perimeter" "nc" {
  name   = "accessPolicies/123456789/servicePerimeters/perimeter-ingress-nc"
  parent = "accessPolicies/123456789"
  title  = "Non-Compliant Perimeter with Ingress"

  perimeter_type = "PERIMETER_TYPE_REGULAR"

  status {
    ingress_policies {
      ingress_from {
        identities = ["allUsers"]
      }
      ingress_to {
        resources = ["*"]
      }
    }

    restricted_services = []
  }
}