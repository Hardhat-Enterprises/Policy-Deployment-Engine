
package terraform.gcp.security.gke_backup.backup_plan.minimum_retention_period_enforcement

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

situations := [
    [
        {
            "situation_description": "GKE Backup Plan must have minimum 30-day retention period for compliance",
            "remedies": ["Set retention_days to at least 30 days"]
        },
        {
            "condition": "Checking minimum retention period",
            "attribute_path": ["retention_policy", 0, "backup_retain_days"],
            "values": [30, null],
            "policy_type": "range"
        }
    ]
]

message := helpers.get_multi_summary(situations, vars.variables).message
details := helpers.get_multi_summary(situations, vars.variables).details