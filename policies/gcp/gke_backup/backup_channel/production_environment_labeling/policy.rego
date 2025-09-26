package terraform.gcp.security.gke_backup.backup_channel.production_environment_labeling

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_channel.vars

# Policy to ensure backup channels have proper production environment labeling
situations := [
    [
        {
            "situation_description": "Backup channel must be labeled as production environment",
            "remedies": ["Set environment label to 'production'", "Add proper environment classification", "Ensure production labeling compliance"]
        },
        {
            "condition": "production_environment_check",
            "attribute_path": ["labels", "environment"],
            "values": ["production"],
            "policy_type": "whitelist"
        }
    ],
    [
        {
            "situation_description": "Backup channel must have required compliance labeling",
            "remedies": ["Add compliance label", "Set compliance to 'required'", "Ensure governance labeling"]
        },
        {
            "condition": "compliance_labeling_check",
            "attribute_path": ["labels", "compliance"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ]
]

# Main policy entry point
message := helpers.get_multi_summary(situations, vars.variables).message
details := helpers.get_multi_summary(situations, vars.variables).details