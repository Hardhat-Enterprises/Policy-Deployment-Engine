package terraform.gcp.security.gke_backup.backup_plan.minimum_retention_period_enforcement

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

conditions := [
    {
        "situation_description": "GKE Backup plan must have minimum 30-day retention period for compliance",
        "remedies": ["Set retention_days to at least 30 days"],
        "condition": "c1",
        "attribute_path": ["retention_policy", 0, "backup_retain_days"],
        "values": [30, null],
        "policy_type": "range"
    }
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details