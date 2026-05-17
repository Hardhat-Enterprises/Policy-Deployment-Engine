package terraform.gcp.security.workflows.google_workflows_workflow.user_env_vars

import data.terraform.helpers
import data.terraform.gcp.security.workflows.google_workflows_workflow.vars

conditions := [
    [
        {
            "situation_description": "User_env_vars is using a variable with hardcoded password or api_key",
            "remedies": ["Store sensitive information using secret manager instead of in user_env_vars"]
        },
        {
            "condition": "Prevent the use of hardcoded passwords or api_key in user_env_vars",
            "attribute_path": ["user_env_vars","api_key"],
            "values": [null],
            "policy_type": "whitelist"
        },
        {
            "condition": "Prevent the use of hardcoded passwords or api_key in user_env_vars",
            "attribute_path": ["user_env_vars","password"],
            "values": [null],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details


