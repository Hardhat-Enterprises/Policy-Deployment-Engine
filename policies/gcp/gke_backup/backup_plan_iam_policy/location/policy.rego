package terraform.gcp.security.gke_backup.backup_plan_iam_policy.location
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan_iam_policy.vars

conditions := [
    [
        {
            "situation_description": "Backup plan IAM policy is not in an approved location",
            "remedies": ["Move backup plan to an approved location (us-central1, us-east1, europe-west1)"]
        },
        {
            "condition": "Check if location is in approved regions",
            "attribute_path": ["location"],
            "values": ["us-central1", "us-east1", "europe-west1"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details