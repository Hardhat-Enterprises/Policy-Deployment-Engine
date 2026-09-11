package terraform.gcp.security.deploy.google_clouddeploy_delivery_pipeline.serial_pipeline_stages_strategy_standard_analysis_custom_checks_task_container_args

import data.terraform.helpers
import data.terraform.gcp.security.deploy.google_clouddeploy_delivery_pipeline.vars

conditions := [
    [
        {
            "situation_description": "The custom check's container argument override is an unapproved placeholder, which could alter what the container executes or accesses at runtime.",
            "remedies": ["Set container.args to the intended runtime arguments, or leave it unset to use the container's default."]
        },
        {
            "condition": "container.args must not be invalid",
            "attribute_path": ["serial_pipeline", 0, "stages", 0, "strategy", 0, "standard", 0, "analysis", 0, "custom_checks", 0, "task", 0, "container", 0, "args"],
            "values": ["invalid-arg"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
