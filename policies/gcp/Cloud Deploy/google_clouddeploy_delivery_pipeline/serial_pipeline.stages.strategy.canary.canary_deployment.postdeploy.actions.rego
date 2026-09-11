package terraform.gcp.security.deploy.google_clouddeploy_delivery_pipeline.serial_pipeline_stages_strategy_canary_canary_deployment_postdeploy_actions

import data.terraform.helpers
import data.terraform.gcp.security.deploy.google_clouddeploy_delivery_pipeline.vars

conditions := [
    [
        {
            "situation_description": "The postdeploy actions include an unapproved placeholder, which could run unapproved code after deployment.",
            "remedies": ["Set postdeploy.actions to the intended skaffold custom actions, or leave it unset if none are required."]
        },
        {
            "condition": "postdeploy.actions must not be invalid",
            "attribute_path": ["serial_pipeline", 0, "stages", 0, "strategy", 0, "canary", 0, "canary_deployment", 0, "postdeploy", 0, "actions"],
            "values": ["invalid-action"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
