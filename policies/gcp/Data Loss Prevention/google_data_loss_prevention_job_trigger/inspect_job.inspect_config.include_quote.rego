package terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.inspect_job_inspect_config_include_quote

import data.terraform.helpers
import data.terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.vars

conditions := [
    [
        {
            "situation_description": "The Data Loss Prevention inspection includes contextual quotes from sensitive findings.",
            "remedies": [
                "Set inspect_job.inspect_config.include_quote to false so findings contain location information without copying matched sensitive content.",
                "Enable contextual quotes only through a documented exception when the investigative need justifies the additional exposure."
            ]
        },
        {
            "condition": "include_quote must remain disabled to avoid duplicating sensitive finding content",
            "attribute_path": ["inspect_job", 0, "inspect_config", 0, "include_quote"],
            "values": [false],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details