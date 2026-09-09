package terraform.gcp.security.dataproc.google_dataproc_batch.environment_config_execution_config_service_account

import data.terraform.helpers
import data.terraform.gcp.security.dataproc.google_dataproc_batch.vars

conditions := [
    [
        {
            "situation_description": "Dataproc Batch runs as a default or unmanaged identity rather than a dedicated least-privilege service account.",
            "remedies": [
                "Set service_account to a dedicated project-managed service account of the form <name>@<project>.iam.gserviceaccount.com, not a default compute identity."
            ]
        },
        {
            "condition": "The workload must run as a dedicated project-managed service account.",
            "attribute_path": ["environment_config", 0, "execution_config", 0, "service_account"],
            "values": [
                "*@*",
                [["dataproc-sa", "spark-sa", "batch-sa"], ["test-project.iam.gserviceaccount.com"]]
            ],
            "policy_type": "pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
