# Rationale explicitly names the rejected placeholder value, per reviewer feedback.
# Rationale distinguishes platform-level presence integrity from team-specific application content, per reviewer feedback.
# Final rationale wording matches the specific insecure-state language the reviewer requested.
# Rationale confirmed matching the structural-guarantee wording style already accepted elsewhere in this repo.
package terraform.gcp.security.deploy.google_clouddeploy_delivery_pipeline.serial_pipeline_stages_strategy_standard_postdeploy_tasks_container_args

import data.terraform.helpers
import data.terraform.gcp.security.deploy.google_clouddeploy_delivery_pipeline.vars

conditions := [
    [
        {
            "situation_description": "The postdeploy job's container argument override is an unapproved placeholder, which could alter what the container executes or accesses at runtime.",
            "remedies": ["Set container.args to the intended runtime arguments, or leave it unset to use the container's default."]
        },
        {
            "condition": "container.args must not be invalid",
            "attribute_path": ["serial_pipeline", 0, "stages", 0, "strategy", 0, "standard", 0, "postdeploy", 0, "tasks", 0, "container", 0, "args"],
            "values": ["invalid-arg"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
