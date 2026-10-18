package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_egress_policy.egress_from_identity_type

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_egress_policy.vars

conditions := [[
    {
        "situation_description": "Ensure dry-run egress policies only allow approved identity types.",
        "remedies": ["Replace broad egress_from.identity_type values such as 'ANY_IDENTITY' with an approved value such as 'ANY_SERVICE_ACCOUNT'."]
    },
    {
        "condition": "egress_from.identity_type only allows approved identity types",
        "attribute_path": ["egress_from", 0, "identity_type"],
        "values": ["ANY_SERVICE_ACCOUNT"],
        "policy_type": "whitelist"
    }
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
