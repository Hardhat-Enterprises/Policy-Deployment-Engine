package terraform.gcp.security.gke_backup.backup_plan_iam_policy.cross_project
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan_iam_policy.vars

conditions := [
    [
        {
            "situation_description": "IAM policy grants access to service accounts from external projects",
            "remedies": ["Use only service accounts from fluent-coder-468700-h4 project"]
        },
        {
            "condition": "Check for cross-project service accounts",
            "attribute_path": ["policy_data"],
            "values": ["serviceAccount:*@fluent-coder-468700-h4.iam.gserviceaccount.com", [["serviceAccount"], ["fluent-coder-468700-h4.iam.gserviceaccount.com"]]],
            "policy_type": "pattern whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details