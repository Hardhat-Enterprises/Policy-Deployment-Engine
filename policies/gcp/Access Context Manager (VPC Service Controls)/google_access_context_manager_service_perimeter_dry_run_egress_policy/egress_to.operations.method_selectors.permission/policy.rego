package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_dry_run_egress_policy.egress_to_operations_method_selectors_permission

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_dry_run_egress_policy.vars

conditions := [[
    {
        "situation_description": "Ensure dry-run egress policies only allow approved IAM permissions.",
        "remedies": ["Replace unapproved egress_to.operations.method_selectors.permission values with approved permissions such as 'bigquery.tables.get'."]
    },
    {
        "condition": "egress_to.operations.method_selectors.permission only allows approved permissions",
        "attribute_path": ["egress_to", 0, "operations", 0, "method_selectors", 0, "permission"],
        "values": ["bigquery.tables.get"],
        "policy_type": "whitelist"
    }
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
