package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeters.service_perimeters_spec_egress_policies_egress_from_identities

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeters.vars

conditions := [[
    {
        "situation_description": "Dry-run egress identities must not contain public or wildcard principals.",
        "remedies": ["Use explicit user, group, service-account, principal, or principal-set identities."]
    },
    {
        "condition": "Dry-run egress identities must not contain public or wildcard principals.",
        "attribute_path": ["service_perimeters", 0, "spec", 0, "egress_policies", 0, "egress_from", 0, "identities"],
        "values": ["*", "allUsers", "allAuthenticatedUsers"],
        "policy_type": "Element Blacklist"
    }
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
