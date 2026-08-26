package terraform.gcp.security.google_access_context_manager_service_perimeter.status_vpc_accessible_services_enable_restriction

import rego.v1

default allow := false

allow if {
    input.status[0].vpc_accessible_services[0].enable_restriction == true
}
