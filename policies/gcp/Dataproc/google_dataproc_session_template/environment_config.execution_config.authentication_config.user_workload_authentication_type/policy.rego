package terraform.gcp.security.dataproc.google_dataproc_session_template.environment_config_execution_config_authentication_config_user_workload_authentication_type

import data.terraform.helpers
import data.terraform.gcp.security.dataproc.google_dataproc_session_template.vars

conditions := [
    [
        {
            "situation_description": "Dataproc Session Template does not explicitly require service account authentication for user workloads.",
            "remedies": [
                "Configure user workload authentication to use SERVICE_ACCOUNT."
            ]
        },
        {
            "condition": "User workload authentication must use a service account.",
            "attribute_path": ["environment_config", 0, "execution_config", 0, "authentication_config", 0, "user_workload_authentication_type"],
            "values": ["SERVICE_ACCOUNT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
