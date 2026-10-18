package terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.vars

conditions := [
    [
        {
            "situation_description": "PREVENT deletion policy is required to protect the resource from unintended deletion",
            "remedies": ["Use PREVENT as the deletion policy"]
        },
        {
            "condition": "Check if the deletion policy is PREVENT",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details