package terraform.gcp.security.gke_backup.backup_plan.name

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

# Simplified approach - use blacklist for invalid names
conditions := [
    {
        "situation_description": "Backup plan name contains invalid characters",
        "remedies": ["Use only lowercase letters, numbers, and hyphens. Name must start with a letter."],
        "conditions": [
            {
                "condition": "c1: name contains uppercase or underscore",
                "attribute_path": ["name"],
                "values": ["BadName_123", "INVALID", "bad_name", "123-start"],
                "policy_type": "blacklist"
            }
        ]
    }
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details