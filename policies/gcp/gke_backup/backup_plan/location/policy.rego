package terraform.gcp.security.gke_backup.backup_plan.location
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

conditions := [
    [
        {
            "situation_description": "Backup plan in non-approved region",
            "remedies": ["Deploy backup plans only in approved regions: us-central1, us-east1, europe-west1"]
        },
        {
            "condition": "Check location compliance",
            "attribute_path": ["location"],
            "values": ["us-central1", "us-east1", "europe-west1"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details