package terraform.gcp.security.gke_backup.backup_plan_iam_policy.members
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan_iam_policy.vars

conditions := [
    [
        {
            "situation_description": "IAM policy contains members from unauthorized domains",
            "remedies": ["Only use members with @gmail.com or your organization's domain"]
        },
        {
            "condition": "Check member email domains",
            "attribute_path": ["policy_data"],
            "values": ["user:*@*", [["user"], ["gmail.com", "yourcompany.com"]]],
            "policy_type": "pattern whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details