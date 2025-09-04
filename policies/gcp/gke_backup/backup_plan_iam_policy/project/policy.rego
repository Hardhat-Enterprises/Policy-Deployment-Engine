package terraform.gcp.security.gke_backup.backup_plan_iam_policy.project
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan_iam_policy.vars

conditions := [
    [
        {
            "situation_description": "Backup plan IAM policy using unauthorized project",
            "remedies": ["Use only authorized project: fluent-coder-468700-h4"]
        },
        {
            "condition": "Check if project is authorized",
            "attribute_path": ["project"],
            "values": ["fluent-coder-468700-h4"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details