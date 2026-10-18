package terraform.gcp.security.deploy.google_clouddeploy_delivery_pipeline.serial_pipeline_stages_strategy_standard_postdeploy_tasks_container_image

import data.terraform.helpers
import data.terraform.gcp.security.deploy.google_clouddeploy_delivery_pipeline.vars

conditions := [
    [
        {
            "situation_description": "The postdeploy job's container image is pinned to the mutable 'latest' tag, a well-known supply-chain risk since the underlying image content can change without a corresponding deployment.",
            "remedies": ["Pin container.image to a specific, immutable version tag or digest instead of 'latest'."]
        },
        {
            "condition": "container.image must not use the 'latest' tag",
            "attribute_path": ["serial_pipeline", 0, "stages", 0, "strategy", 0, "standard", 0, "postdeploy", 0, "tasks", 0, "container", 0, "image"],
            "values": ["*:*", [[], ["latest"]]],
            "policy_type": "pattern blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
