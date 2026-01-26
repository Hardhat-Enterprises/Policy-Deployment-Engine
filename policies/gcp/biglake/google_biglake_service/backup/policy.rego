package terraform.gcp.security.biglake.google_biglake_service.backup

import data.terraform.helpers
import data.terraform.gcp.security.biglake.google_biglake_service.vars

conditions := [
    [
    {
        "situation_description" : "Backup policy for BigLake is not configured or is insufficient.",
        "remedies":[
            "Ensure regular backups are configured and validated for BigLake data."
        ]
    },
    {
        "condition": "Check that backup schedules and retention periods are configured for BigLake.",
        "attribute_path" : ["backup_config", 0, "schedule"],
        "values" : [
            "daily",
            "weekly"
        ],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
