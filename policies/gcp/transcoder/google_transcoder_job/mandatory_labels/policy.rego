package terraform.gcp.security.transcoder.google_transcoder_job.mandatory_labels

import data.terraform.helpers
import data.terraform.gcp.security.transcoder.google_transcoder_job.vars

conditions := [
    [
        {
            "situation_description": "The transcoder job is missing the required environment label.",
            "remedies": [
                "Add the required label 'environment' with an approved value such as 'dev'.",
                "Use labels to support ownership, auditing, and environment tracking."
            ]
        },
        {
            "condition": "Check if required environment label is missing or not approved",
            "attribute_path": ["labels", "environment"],
            "values": ["dev"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details