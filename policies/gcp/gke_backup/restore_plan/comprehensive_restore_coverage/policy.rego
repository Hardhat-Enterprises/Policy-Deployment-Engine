package terraform.gcp.security.gke_backup.restore_plan.comprehensive_restore_coverage

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.restore_plan.vars

# Policy to ensure comprehensive restore coverage
situations := [
    [
        {
            "situation_description": "Restore plan must cover all namespaces for comprehensive recovery",
            "remedies": ["Set all_namespaces to true", "Remove selected_namespaces configuration", "Ensure complete cluster restore coverage"]
        },
        {
            "condition": "all_namespaces_restore_check",
            "attribute_path": ["restore_config", 0, "all_namespaces"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ],
    [
        {
            "situation_description": "Restore plan must include all cluster resource types",
            "remedies": ["Set all_group_kinds to true", "Remove selected_group_kinds limitation", "Ensure all resource types are restored"]
        },
        {
            "condition": "all_group_kinds_restore_check",
            "attribute_path": ["restore_config", 0, "cluster_resource_restore_scope", 0, "all_group_kinds"],
            "values": [false],
            "policy_type": "blacklist"
        }
    ]
]

# Main policy entry point
message := helpers.get_multi_summary(situations, vars.variables).message
details := helpers.get_multi_summary(situations, vars.variables).details