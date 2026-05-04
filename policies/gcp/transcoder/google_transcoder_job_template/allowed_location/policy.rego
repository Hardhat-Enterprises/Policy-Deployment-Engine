package terraform.gcp.security.transcoder.google_transcoder_job_template.allowed_location

import data.terraform.helpers
import data.terraform.gcp.security.transcoder.google_transcoder_job_template.vars

conditions := [
    [
        {
            "situation_description": "The transcoder job template location is not in the allowed list.",
            "remedies": [
                "Use an approved location such as 'us-central1'.",
                "Consult Google Transcoder documentation for supported job template locations."
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