package terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.vars

conditions := [
    [
        {
            "situation_description": "RETAIN deletion policy is not allowed because it can prevent required resource deletion and leave managed resources exposed or unmanaged",
            "remedies": ["Use DELETE as the deletion policy unless resource retention is explicitly approved"]
        },
        {
            "condition": "Check if the deletion policy is RETAIN",
            "attribute_path": ["deletion_policy"],
            "values": ["RETAIN"],
            "policy_type": "blacklist"
        }
    ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details