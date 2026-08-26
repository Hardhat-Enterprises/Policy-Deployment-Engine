package terraform.gcp.security.google_access_context_manager_service_perimeter.spec_vpc_accessible_services_enable_restriction

import rego.v1

default allow := false

allow if {
    input.spec[0].vpc_accessible_services[0].enable_restriction == true
}
