package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_dry_run_egress_policy.egress_from_identities

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_dry_run_egress_policy.vars

conditions := [[
    {
        "situation_description": "Ensure dry-run egress policies do not allow public source identities.",
        "remedies": ["Remove broad public identities such as 'allUsers' and 'allAuthenticatedUsers' from egress_from.identities."]
    },
    {
        "condition": "egress_from.identities must not contain public identities",
        "attribute_path": ["egress_from", 0, "identities"],
        "values": ["allUsers", "allAuthenticatedUsers"],
        "policy_type": "blacklist"
    }
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
