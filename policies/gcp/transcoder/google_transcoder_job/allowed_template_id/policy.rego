package terraform.gcp.security.transcoder.google_transcoder_job.allowed_template_id

import data.terraform.helpers
import data.terraform.gcp.security.transcoder.google_transcoder_job.vars

conditions := [
    [
        {
            "situation_description": "The transcoder job template ID is not in the allowed list.",
            "remedies": [
                "Use an approved template ID such as 'preset/web-hd'.",
                "Avoid using unapproved custom templates for transcoder jobs."
            ]
        },
        {
            "condition": "Check if template_id is not in the allowed whitelist",
            "attribute_path": ["template_id"],
            "values": ["preset/web-hd"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details