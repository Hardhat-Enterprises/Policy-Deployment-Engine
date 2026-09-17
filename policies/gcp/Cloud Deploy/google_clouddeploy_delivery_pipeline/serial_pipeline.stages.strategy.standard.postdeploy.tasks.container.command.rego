package terraform.gcp.security.deploy.google_clouddeploy_delivery_pipeline.serial_pipeline_stages_strategy_standard_postdeploy_tasks_container_command

import data.terraform.helpers
import data.terraform.gcp.security.deploy.google_clouddeploy_delivery_pipeline.vars

conditions := [
    [
        {
            "situation_description": "The postdeploy job's container command invokes a generic shell interpreter, allowing arbitrary code execution.",
            "remedies": ["Use a fixed, vetted binary as the entrypoint instead of invoking a generic shell interpreter."]
        },
        {
            "condition": "container.command must not invoke a generic shell interpreter",
            "attribute_path": ["serial_pipeline", 0, "stages", 0, "strategy", 0, "standard", 0, "postdeploy", 0, "tasks", 0, "container", 0, "command"],
            "values": ["/bin/sh"],
            "policy_type": "element blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
