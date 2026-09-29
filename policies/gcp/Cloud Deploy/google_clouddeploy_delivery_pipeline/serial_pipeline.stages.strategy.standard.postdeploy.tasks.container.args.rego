package terraform.gcp.security.deploy.google_clouddeploy_delivery_pipeline.serial_pipeline_stages_strategy_standard_postdeploy_tasks_container_args

import data.terraform.helpers
import data.terraform.gcp.security.deploy.google_clouddeploy_delivery_pipeline.vars

conditions := [
    [
        {
            "situation_description": "The postdeploy job's container args contain a plaintext credential, which is visible to any process on the same host.",
            "remedies": ["Pass credentials via a secret manager reference or environment variable, not as a plaintext command-line argument."]
        },
        {
            "condition": "container.args must not contain a plaintext credential",
            "attribute_path": ["serial_pipeline", 0, "stages", 0, "strategy", 0, "standard", 0, "postdeploy", 0, "tasks", 0, "container", 0, "args"],
            "values": ["password="],
            "policy_type": "element blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
