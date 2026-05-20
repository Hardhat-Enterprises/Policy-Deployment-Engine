package terraform.gcp.security.dataflow.google_dataflow_job.on_delete

import data.terraform.helpers
import data.terraform.gcp.security.dataflow.google_dataflow_job.vars

conditions := [
    [
        {
            "situation_description": "Dataflow job on_delete is set to 'cancel' which immediately terminates the job without processing in-flight data, risking data loss.",
            "remedies": ["Set 'on_delete' to 'drain' to ensure in-flight data is fully processed before job termination."]
        },
        {
            "condition": "Check if on_delete is set to drain",
            "attribute_path": ["on_delete"],
            "values": ["drain"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details