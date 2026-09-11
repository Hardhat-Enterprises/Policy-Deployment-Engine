package terraform.gcp.security.deploy.google_clouddeploy_delivery_pipeline.serial_pipeline_stages_strategy_standard_verify_config_tasks_container_command

import data.terraform.helpers
import data.terraform.gcp.security.deploy.google_clouddeploy_delivery_pipeline.vars

conditions := [
    [
        {
            "situation_description": "The verify job's container command override is an unapproved placeholder, which could bypass the container's intended entrypoint.",
            "remedies": ["Set container.command to the intended entrypoint, or leave it unset to use the container's default."]
        },
        {
            "condition": "container.command must not be invalid",
            "attribute_path": ["serial_pipeline", 0, "stages", 0, "strategy", 0, "standard", 0, "verify_config", 0, "tasks", 0, "container", 0, "command"],
            "values": ["invalid-command"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
