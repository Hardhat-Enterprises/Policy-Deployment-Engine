package terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator.vars

conditions := [
    [
    {"situation_description" : "Terraform is permitted to destroy this policy orchestrator, which would stop the OS policies it manages from being applied and let machines drift out of their required state with nothing correcting them",
    "remedies" : ["Set deletion_policy to PREVENT so the orchestrator cannot be removed by a routine apply"]},
    {
        "condition": "deletion_policy must be PREVENT to protect OS policy enforcement",
        "attribute_path" : ["deletion_policy"],
        "values" : ["PREVENT"],
        "policy_type" : "whitelist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details