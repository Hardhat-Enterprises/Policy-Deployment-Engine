package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_dry_run_egress_policy.egress_to_resources

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_dry_run_egress_policy.vars

conditions := [[
    {
        "situation_description": "Ensure dry-run egress policies do not allow unrestricted destination resources.",
        "remedies": ["Replace wildcard egress_to.resources values such as '*' with explicit approved destination resources."]
    },
    {
        "condition": "egress_to.resources must not allow wildcard access",
        "attribute_path": ["egress_to", 0, "resources"],
        "values": ["*"],
        "policy_type": "blacklist"
    }
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
