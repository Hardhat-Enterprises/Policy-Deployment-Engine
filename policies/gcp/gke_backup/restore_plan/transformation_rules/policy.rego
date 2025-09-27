package terraform.gcp.security.gke_backup.google_gke_backup_restore_plan.transformation_rules

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.google_gke_backup_restore_plan.vars

conditions := [
    [
        {
            "situation_description": "Transformation rules using overly broad resource groups",
            "remedies": ["Specify targeted resource groups and kinds", "Avoid using wildcards (*) in resource groups"]
        },
        {
            "condition": "c1: resource_filter group should not use wildcards",
            "attribute_path": ["restore_config", 0, "transformation_rules", 0, "resource_filter", 0, "group_kinds", 0, "resource_group"],
            "values": ["*", ""],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details