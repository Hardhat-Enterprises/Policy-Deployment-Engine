package terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.orchestrated_resource_id

import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.vars

conditions := [
    [
        {
            "situation_description": "An unapproved orchestrated resource ID is not allowed because it may cause the security policy to target an unintended resource",
            "remedies": ["Use the approved orchestrated resource ID"]
        },
        {
            "condition": "Check if the orchestrated resource ID is unapproved",
            "attribute_path": ["orchestrated_resource", "id"],
            "values": ["unapproved-orchestrated-resource"],
            "policy_type": "blacklist"
        }
    ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details