package terraform.gcp.security.gke_backup.backup_plan_iam_policy.conditions
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan_iam_policy.vars

conditions := [
    [
        {
            "situation_description": "IAM policy grants permanent access without time-based conditions",
            "remedies": ["Add conditional bindings with expiration dates for temporary access"]
        },
        {
            "condition": "Check for time-based conditions",
            "attribute_path": ["policy_data"],
            "values": ["expires", "request.time", "timestamp"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details