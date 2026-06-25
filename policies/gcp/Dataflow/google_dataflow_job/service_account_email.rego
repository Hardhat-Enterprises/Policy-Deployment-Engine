package terraform.gcp.security.dataflow.google_dataflow_job.service_account_email

import data.terraform.helpers
import data.terraform.gcp.security.dataflow.google_dataflow_job.vars

conditions := [
    [
        {
            "situation_description": "Dataflow job does not specify a dedicated service account, defaulting to the Compute Engine default SA which has overly broad permissions.",
            "remedies": ["Set 'service_account_email' to a dedicated service account with least-privilege permissions."]
        },
        {
            "condition": "Check if a dedicated service account is configured",
            "attribute_path": ["service_account_email"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details