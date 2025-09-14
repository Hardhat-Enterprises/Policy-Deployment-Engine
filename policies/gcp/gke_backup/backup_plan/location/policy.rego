package terraform.gcp.security.gke_backup.backup_plan.location
<<<<<<< HEAD

=======
>>>>>>> c8b7c197646289816dec64ed2226f49abcf62e72
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

conditions := [
    [
        {
<<<<<<< HEAD
            "situation_description": "GKE backup plan must be in approved Australian regions",
            "remedies": ["Set location to australia-southeast1 or australia-southeast2"]
        },
        {
            "condition": "Checking backup plan location",
            "attribute_path": ["location"],
            "values": ["australia-southeast1", "australia-southeast2"],
=======
            "situation_description": "Backup plan in non-approved region",
            "remedies": ["Deploy backup plans only in approved regions: us-central1, us-east1, europe-west1"]
        },
        {
            "condition": "Check location compliance",
            "attribute_path": ["location"],
            "values": ["us-central1", "us-east1", "europe-west1"],
>>>>>>> c8b7c197646289816dec64ed2226f49abcf62e72
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details