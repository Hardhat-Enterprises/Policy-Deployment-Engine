package terraform.gcp.security.gke_backup.backup_plan.minimum_retention_period_enforcement

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

# Policy to ensure minimum retention periods are enforced
situations := [
    [
        {
            "situation_description": "Backup retention period must be at least 90 days",
            "remedies": ["Set backup_retain_days to minimum 90", "Update retention policy for compliance"]
        },
        {
            "condition": "minimum_backup_retention_check",
            "attribute_path": ["retention_policy", 0, "backup_retain_days"],
            "values": [90, null],  # Lower bound: 90 days, upper bound: unlimited
            "policy_type": "range"
        }
    ],
    [
        {
            "situation_description": "Backup delete lock period must be at least 7 days",
            "remedies": ["Set backup_delete_lock_days to minimum 7", "Ensure backup protection period"]
        },
        {
            "condition": "minimum_delete_lock_check",
            "attribute_path": ["retention_policy", 0, "backup_delete_lock_days"],
            "values": [7, null],  # Lower bound: 7 days, upper bound: unlimited
            "policy_type": "range"
        }
    ],
    [
        {
            "situation_description": "Retention policy must be locked to prevent accidental changes",
            "remedies": ["Set locked to true", "Enable retention policy protection"]
        },
        {
            "condition": "retention_policy_locked_check",
            "attribute_path": ["retention_policy", 0, "locked"],
            "values": [false],
            "policy_type": "blacklist"
        }
    ]
]

# Main policy entry point
message := helpers.get_multi_summary(situations, vars.variables).message
details := helpers.get_multi_summary(situations, vars.variables).details