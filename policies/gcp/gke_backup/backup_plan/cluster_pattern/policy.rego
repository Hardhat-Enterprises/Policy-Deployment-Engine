package terraform.gcp.security.gke_backup.google_gke_backup_backup_plan.cluster_pattern

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.google_gke_backup_backup_plan.vars

conditions := [
    [
        {
            "situation_description": "Cluster reference does not follow approved naming patterns",
            "remedies": ["Ensure cluster follows organizational naming standards", "Use approved project/location/cluster combinations"]
        },
        {
            "condition": "c1: cluster must match approved pattern",
            "attribute_path": ["cluster"],
            "values": [
                "projects/*/locations/*/clusters/*",
                [["test-project", "prod-project", "dev-project"], 
                 ["us-central1", "us-east1", "europe-west1"], 
                 ["my-cluster", "prod-cluster", "dev-cluster"]]
            ],
            "policy_type": "pattern whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details