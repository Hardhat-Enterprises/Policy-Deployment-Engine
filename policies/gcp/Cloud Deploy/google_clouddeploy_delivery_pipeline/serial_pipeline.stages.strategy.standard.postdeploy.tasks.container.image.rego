package terraform.gcp.security.deploy.google_clouddeploy_delivery_pipeline.serial_pipeline_stages_strategy_standard_postdeploy_tasks_container_image

import data.terraform.helpers
import data.terraform.gcp.security.deploy.google_clouddeploy_delivery_pipeline.vars

conditions := [
    [
        {
            "situation_description": "The postdeploy job's container image is empty or invalid, so an unapproved or unpinned image could execute after deployment.",
            "remedies": ["Set container.image to a valid, deployment-specific container image reference."]
        },
        {
            "condition": "container.image must not be empty or invalid",
            "attribute_path": ["serial_pipeline", 0, "stages", 0, "strategy", 0, "standard", 0, "postdeploy", 0, "tasks", 0, "container", 0, "image"],
            "values": [null, "", "invalid-image"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
