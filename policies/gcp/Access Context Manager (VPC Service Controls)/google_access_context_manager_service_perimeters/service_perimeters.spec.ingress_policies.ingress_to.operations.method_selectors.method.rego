package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeters.service_perimeters_spec_ingress_policies_ingress_to_operations_method_selectors_method

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeters.vars

conditions := [[
    {
        "situation_description": "Dry-run ingress operations must not allow every API method.",
        "remedies": ["Replace wildcard method access with an explicit API method."]
    },
    {
        "condition": "Dry-run ingress operations must not allow every API method.",
        "attribute_path": ["service_perimeters", 0, "spec", 0, "ingress_policies", 0, "ingress_to", 0, "operations", 0, "method_selectors", 0, "method"],
        "values": ["*"],
        "policy_type": "Blacklist"
    }
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
