package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeters.service_perimeters_spec_vpc_accessible_services_enable_restriction

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeters.vars

conditions := [[
    {
        "situation_description": "Dry-run VPC accessible-service restrictions must be enabled.",
        "remedies": ["Set enable_restriction to true."]
    },
    {
        "condition": "Dry-run VPC accessible-service restrictions must be enabled.",
        "attribute_path": ["service_perimeters", 0, "spec", 0, "vpc_accessible_services", 0, "enable_restriction"],
        "values": [true],
        "policy_type": "Whitelist"
    }
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
