package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.basic_conditions_ip_subnetworks

import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.vars
import data.terraform.helpers

conditions := [[
        {
                "situation_description": "Ensure Access Context Manager access level conditions restrict IP subnetworks and do not allow unrestricted internet access.",
                "remedies": ["Update ip_subnetworks to only include specific and trusted CIDR blocks."],
        },
        {
                "condition": "ip_subnetworks does not contain 0.0.0.0/0",
                "attribute_path": ["basic", 0, "conditions", 0, "ip_subnetworks"],
                "values": ["0.0.0.0/0"],
                "policy_type": "blacklist",
        },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
