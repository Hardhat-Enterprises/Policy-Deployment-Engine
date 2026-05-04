package terraform.gcp.security.transcoder.google_transcoder_job.allowed_location

import data.terraform.helpers
import data.terraform.gcp.security.transcoder.google_transcoder_job.vars

conditions := [
    [
        {
            "situation_description": "The transcoder job location is not in the allowed list.",
            "remedies": [
                "Use an approved location such as 'us-central1'.",
                "Consult Google Transcoder documentation for supported job locations."
            ]
        },
        {
            "condition": "Check if location is not in the allowed whitelist",
            "attribute_path": ["location"],
            "values": ["us-central1"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details