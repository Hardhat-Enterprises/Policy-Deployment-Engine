package terraform.gcp.security.deploy.google_clouddeploy_delivery_pipeline.serial_pipeline_stages_strategy_standard_predeploy_tasks_container_env

import data.terraform.helpers
import data.terraform.gcp.security.deploy.google_clouddeploy_delivery_pipeline.vars

conditions := [
    [
        {
            "situation_description": "The predeploy job's container environment variables are empty, so runtime configuration expected by the container may be missing.",
            "remedies": ["Set container.env to the intended environment variables, or leave it unset if none are required."]
        },
        {
            "condition": "container.env must not be empty",
            "attribute_path": ["serial_pipeline", 0, "stages", 0, "strategy", 0, "standard", 0, "predeploy", 0, "tasks", 0, "container", 0, "env"],
            "values": [null, {}, {"ENV_NAME": "invalid"}],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
