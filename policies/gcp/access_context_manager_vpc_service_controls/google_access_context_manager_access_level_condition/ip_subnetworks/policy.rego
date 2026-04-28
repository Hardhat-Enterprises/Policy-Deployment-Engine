package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level_condition.ip_subnetworks

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level_condition.vars

conditions := [
    [
        {
            "situation_description": "Ensure Access Context Manager level condition restricts IP subnetworks and does not allow full internet access (0.0.0.0/0).",
            "remedies": ["Update ip_subnetworks to only include specific and trusted CIDR blocks."]
        },
        {
            "condition": "ip_subnetworks does not contain 0.0.0.0/0",
            "attribute_path": ["ip_subnetworks"],
            "values": ["0.0.0.0/0"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details