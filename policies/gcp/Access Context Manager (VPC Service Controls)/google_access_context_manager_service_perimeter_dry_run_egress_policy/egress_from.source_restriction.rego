package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_dry_run_egress_policy.egress_from_source_restriction

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_dry_run_egress_policy.vars

conditions := [[
    {
        "situation_description": "Ensure dry-run egress policies enable source restriction checks.",
        "remedies": ["Set egress_from.source_restriction to SOURCE_RESTRICTION_ENABLED so source-based egress restrictions are applied."]
    },
    {
        "condition": "egress_from.source_restriction must be enabled",
        "attribute_path": ["egress_from", 0, "source_restriction"],
        "values": ["SOURCE_RESTRICTION_ENABLED"],
        "policy_type": "whitelist"
    }
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
