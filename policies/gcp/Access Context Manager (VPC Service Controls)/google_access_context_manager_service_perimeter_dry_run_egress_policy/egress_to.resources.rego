package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_dry_run_egress_policy.egress_to.resources

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_dry_run_egress_policy.vars

conditions := [[
    {
        "situation_description": "Ensure dry-run egress policies only allow access to approved destination resources.",
        "remedies": ["Replace wildcard egress_to.resources with approved project resources such as 'projects/123456789'."]
    },
    {
        "condition": "egress_to.resources only contains approved resources",
        "attribute_path": ["egress_to", 0, "resources"],
        "values": ["projects/123456789"],
        "policy_type": "whitelist"
    }
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
