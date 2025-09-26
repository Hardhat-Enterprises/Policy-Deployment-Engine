package terraform.gcp.security.gke_backup.restore_plan.mandatory_transformation_rules

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.restore_plan.vars

# Policy to ensure transformation rules are defined for restore plans
situations := [
    [
        {
            "situation_description": "Restore plan must include transformation rules for proper data handling",
            "remedies": ["Add transformation_rules configuration", "Define field transformations", "Ensure proper data transformation during restore"]
        },
        {
            "condition": "transformation_rules_check",
            "attribute_path": ["restore_config", 0, "transformation_rules"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ]
]

# Main policy entry point
message := helpers.get_multi_summary(situations, vars.variables).message
details := helpers.get_multi_summary(situations, vars.variables).details