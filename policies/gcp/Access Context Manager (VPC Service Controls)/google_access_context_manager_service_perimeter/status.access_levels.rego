package terraform.gcp.security.google_access_context_manager_service_perimeter.status_access_levels

import rego.v1

default allow := false

allow if {
    levels := input.status[0].access_levels
    count(levels) > 0
    every level in levels {
        startswith(level, "accessPolicies/")
        contains(level, "/accessLevels/")
    }
}
