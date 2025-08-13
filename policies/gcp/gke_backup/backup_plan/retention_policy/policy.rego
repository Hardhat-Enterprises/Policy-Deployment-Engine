package terraform.gcp.security.gke_backup.backup_plan.retention_policy

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

conditions := [
    {
        "situation_description": "GKE backup retention period is too short",
        "remedies": ["Set retention_policy.backup_retain_days to at least 7 days"],
        "conditions": [
            {
                "condition": "c1: retention days less than 7",
                "attribute_path": ["retention_policy", 0, "backup_retain_days"],
                "values": {"lower_bound": 1, "upper_bound": 6},
                "policy_type": "range"
            }
        ]
    }
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details