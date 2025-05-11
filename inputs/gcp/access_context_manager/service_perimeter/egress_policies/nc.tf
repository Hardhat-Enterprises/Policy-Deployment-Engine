# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_access_context_manager_service_perimeter" "nc" {
  name   = "accessPolicies/123456789/servicePerimeters/perimeter2"
  parent = "accessPolicies/123456789"
  title  = "Non-Compliant Perimeter"

  perimeter_type = "PERIMETER_TYPE_REGULAR"

  status {
    egress_policies {
      egress_from {
        identities = ["allUsers"]
      }
      egress_to {
        resources = ["*"]
      }
    }

    restricted_services = []
  }
}