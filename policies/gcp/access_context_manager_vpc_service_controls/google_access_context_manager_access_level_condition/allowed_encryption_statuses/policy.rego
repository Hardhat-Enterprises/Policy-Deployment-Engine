package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level_condition.allowed_encryption_statuses

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level_condition.vars

conditions := [
    [
        {
            "situation_description": "Ensure Access Context Manager level condition requires device encryption.",
            "remedies": ["Update allowed_encryption_statuses to explicitly include only ENCRYPTED."]
        },
        {
            "condition": "allowed_encryption_statuses is restricted to ENCRYPTED",
            "attribute_path": ["device_policy", 0, "allowed_encryption_statuses"],
            "values": ["ENCRYPTED"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details