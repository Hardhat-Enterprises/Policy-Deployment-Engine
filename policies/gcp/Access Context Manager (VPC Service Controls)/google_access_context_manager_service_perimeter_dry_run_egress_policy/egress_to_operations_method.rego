package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_dry_run_egress_policy.egress_to_operations_method

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_dry_run_egress_policy.vars

conditions := [[
    {
        "situation_description": "Ensure dry-run egress policies only allow approved API methods.",
        "remedies": ["Replace wildcard egress_to.operations.method_selectors.method with an approved method such as 'google.cloud.bigquery.v2.JobService.GetJob'."]
    },
    {
        "condition": "egress_to.operations.method_selectors.method only allows approved methods",
        "attribute_path": ["egress_to", 0, "operations", 0, "method_selectors", 0, "method"],
        "values": ["google.cloud.bigquery.v2.JobService.GetJob"],
        "policy_type": "whitelist"
    }
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
