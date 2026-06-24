package terraform.gcp.security.dataflow.google_dataflow_job.enable_streaming_engine

import data.terraform.helpers
import data.terraform.gcp.security.dataflow.google_dataflow_job.vars

conditions := [
    [
        {
            "situation_description": "Dataflow job does not have Streaming Engine enabled, increasing the number of worker VMs and persistent disks required.",
            "remedies": ["Set 'enable_streaming_engine' to 'true' to offload pipeline execution to the managed Dataflow service backend."]
        },
        {
            "condition": "Check if streaming engine is enabled",
            "attribute_path": ["enable_streaming_engine"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details