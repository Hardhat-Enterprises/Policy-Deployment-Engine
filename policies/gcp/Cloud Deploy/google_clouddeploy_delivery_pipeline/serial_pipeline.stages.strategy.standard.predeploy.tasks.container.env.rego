package terraform.gcp.security.deploy.google_clouddeploy_delivery_pipeline.serial_pipeline_stages_strategy_standard_predeploy_tasks_container_env

import data.terraform.helpers
import data.terraform.gcp.security.deploy.google_clouddeploy_delivery_pipeline.vars

conditions := [
    [
        {
            "situation_description": "The container environment variables are populated, exposing plaintext values with no way to generically verify they are not secrets.",
            "remedies": ["Leave container.env empty and source any required configuration through a mechanism other than plaintext env vars."]
        },
        {
            "condition": "container.env must remain empty or absent",
            "attribute_path": ["serial_pipeline", 0, "stages", 0, "strategy", 0, "standard", 0, "predeploy", 0, "tasks", 0, "container", 0, "env"],
            "values": [null, {}],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
