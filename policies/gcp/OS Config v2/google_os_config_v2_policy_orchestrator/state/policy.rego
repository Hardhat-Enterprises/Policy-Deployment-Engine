package terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator.state

import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator.vars

conditions := [
    [
    {"situation_description" : "The orchestrator is stopped, so it takes no action and the OS policies it manages are never applied to the fleet",
    "remedies" : ["Set state to ACTIVE so the orchestrator applies its OS policies"]},
    {
        "condition": "Check that the orchestrator is not stopped",
        "attribute_path" : ["state"],
        "values" : ["STOPPED"],
        "policy_type" : "blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details