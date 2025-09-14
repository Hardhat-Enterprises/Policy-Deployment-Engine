package terraform.gcp.security.gke_backup.backup_plan.include_secrets

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

conditions := [
    [
        {
            "situation_description": "Backup plan must include secrets",
            "remedies": ["Set include_secrets to true"]
        },
        {
            "condition": "Checking include_secrets setting",
            "attribute_path": ["backup_config", 0, "include_secrets"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details