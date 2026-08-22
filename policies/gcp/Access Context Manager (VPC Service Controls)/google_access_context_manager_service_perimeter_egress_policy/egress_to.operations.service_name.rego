package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_egress_policy.egress_to_operations_service_name

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_egress_policy.vars

conditions := [[
    {
        "situation_description": "Ensure dry-run egress policies only allow approved Google Cloud services.",
        "remedies": ["Replace wildcard egress_to.operations.service_name with an approved service such as 'bigquery.googleapis.com'."]
    },
    {
        "condition": "egress_to.operations.service_name only allows approved services",
        "attribute_path": ["egress_to", 0, "operations", 0, "service_name"],
        "values": ["bigquery.googleapis.com"],
        "policy_type": "whitelist"
    }
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
