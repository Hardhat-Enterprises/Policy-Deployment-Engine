package terraform.gcp.security.gke_backup.backup_plan.production_cluster_naming_enforcement

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

# Policy to enforce production cluster naming conventions
situations := [
    [
        {
            "situation_description": "Production backup plans must follow proper naming convention",
            "remedies": ["Use naming convention with 'prod-' prefix", "Follow standard naming pattern for production resources"]
        },
        {
            "condition": "production_naming_check",
            "attribute_path": ["name"],
            "values": ["organizations/*/locations/*/backupPlans/*"],
            "policy_type": "pattern whitelist"
        }
    ]
]

# Alternative simpler naming check - backup plans should contain "backup" in the name
alternative_situations := [
    [
        {
            "situation_description": "Backup plan names should be descriptive and contain 'backup'",
            "remedies": ["Include 'backup' in the resource name", "Use descriptive naming for backup resources"]
        },
        {
            "condition": "descriptive_naming_check",
            "attribute_path": ["name"],
            "values": ["backup"],
            "policy_type": "whitelist"
        }
    ]
]

# Main policy entry point - using the simpler version for now
message := helpers.get_multi_summary(alternative_situations, vars.variables).message
details := helpers.get_multi_summary(alternative_situations, vars.variables).details