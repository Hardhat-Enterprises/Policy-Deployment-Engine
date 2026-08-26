package terraform.gcp.security.google_access_context_manager_service_perimeter.status_ingress_policies_ingress_from_identity_type

import rego.v1

default allow := false

allow if {
    input.status[0].ingress_policies[0].ingress_from[0].identity_type != "ANY_IDENTITY"
}
