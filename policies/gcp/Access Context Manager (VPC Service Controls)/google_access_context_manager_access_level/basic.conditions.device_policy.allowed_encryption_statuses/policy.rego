package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.basic_conditions_device_policy_allowed_encryption_statuses

import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.vars
import data.terraform.helpers

conditions := [[
        {
                "situation_description": "Ensure Access Context Manager access level conditions require device encryption.",
                "remedies": ["Update allowed_encryption_statuses to explicitly include only ENCRYPTED."],
        },
        {
                "condition": "allowed_encryption_statuses is restricted to ENCRYPTED",
                "attribute_path": ["basic", 0, "conditions", 0, "device_policy", 0, "allowed_encryption_statuses"],
                "values": ["ENCRYPTED"],
                "policy_type": "whitelist",
        },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
