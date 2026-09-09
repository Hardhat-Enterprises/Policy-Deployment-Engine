package terraform.gcp.security.dataproc.google_dataproc_batch.environment_config_execution_config_service_account

import data.terraform.helpers
import data.terraform.gcp.security.dataproc.google_dataproc_batch.vars

conditions := [
    [
        {
            "situation_description": "Dataproc Batch does not specify a dedicated service account, which may result in use of a default identity with overly broad permissions.",
            "remedies": [
                "Configure a dedicated service account with least-privilege permissions."
            ]
        },
        {
            "condition": "A dedicated service account must be configured.",
            "attribute_path": ["environment_config", 0, "execution_config", 0, "service_account"],
            "values": [null, ""],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
