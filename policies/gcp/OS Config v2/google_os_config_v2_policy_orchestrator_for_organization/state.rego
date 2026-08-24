package terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.state

import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.vars

conditions := [
    [
        {
            "situation_description": "The policy orchestrator must remain ACTIVE so that configured OS policies continue to be evaluated and managed.",
            "remedies": ["Set the policy orchestrator state to ACTIVE"]
        },
        {
            "condition": "Check if the orchestrator state is STOPPED",
            "attribute_path": ["state"],
            "values": ["STOPPED"],
            "policy_type": "blacklist"
        }
    ],
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details