package terraform.gcp.security.dataform.google_dataform_repository_release_config.cron_required

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataform.google_dataform_repository_release_config.vars

conditions := [
    [
        {
            "situation_description": "Release configs must define a cron schedule",
            "remedies": ["Set cron_schedule to a valid cron string (e.g., '0 2 * * *')"]
        },
        {
            "condition": "cron_schedule must not be null",
            "attribute_path": ["cron_schedule"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "Release configs must define a cron schedule",
            "remedies": ["Set cron_schedule to a valid cron string (e.g., '0 2 * * *')"]
        },
        {
            "condition": "cron_schedule must not be empty",
            "attribute_path": ["cron_schedule"],
            "values": [""],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details



