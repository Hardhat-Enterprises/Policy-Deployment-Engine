package terraform.gcp.security.gke_backup.backup_plan_iam_policy.name
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan_iam_policy.vars

conditions := [
    [
        {
            "situation_description": "Backup plan name doesn't follow naming convention",
            "remedies": ["Use format: <env>-backup-plan where env is prod, dev, test, or staging"]
        },
        {
            "condition": "Name must follow environment pattern",
            "attribute_path": ["name"],
            "values": ["*-backup-plan", [["prod", "dev", "test", "staging"]]],
            "policy_type": "pattern whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details