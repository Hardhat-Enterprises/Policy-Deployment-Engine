package terraform.gcp.security.transcoder.google_transcoder_job_template.allowed_location

import data.terraform.helpers
import data.terraform.gcp.security.transcoder.google_transcoder_job_template.vars

conditions := [
    [
        {
            "situation_description": "Transcoder job template location is outside the approved Australian region.",
            "remedies": [
                "Set the transcoder job template location to 'australia-southeast1'.",
                "Use approved Australian regions to support data residency and regional governance requirements."
            ]
        },
        {
            "condition": "Transcoder job template location must be australia-southeast1",
            "attribute_path": ["location"],
            "values": ["australia-southeast1"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details