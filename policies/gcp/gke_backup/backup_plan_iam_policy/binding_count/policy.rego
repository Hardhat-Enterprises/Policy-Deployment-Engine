package terraform.gcp.security.gke_backup.backup_plan_iam_policy.binding_count
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan_iam_policy.vars

# Note: This is a simplified check - ideally you'd parse the JSON and count bindings
conditions := [
    [
        {
            "situation_description": "IAM policy has too many role bindings",
            "remedies": ["Consolidate permissions into fewer, more specific roles"]
        },
        {
            "condition": "Check for excessive bindings",
            "attribute_path": ["policy_data"],
            "values": ["roles/owner"],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details