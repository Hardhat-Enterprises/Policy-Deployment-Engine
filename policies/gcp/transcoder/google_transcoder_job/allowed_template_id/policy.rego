package terraform.gcp.security.transcoder.google_transcoder_job.allowed_template_id

import data.terraform.helpers
import data.terraform.gcp.security.transcoder.google_transcoder_job.vars

conditions := [
    [
        {
            "situation_description": "Transcoder job is using an unapproved template ID.",
            "remedies": [
                "Set the transcoder job template_id to 'preset/web-hd'.",
                "Use only approved transcoder templates to avoid unsafe or unreviewed job configurations."
            ]
        },
        {
            "condition": "Transcoder job template_id must be preset/web-hd",
            "attribute_path": ["template_id"],
            "values": ["preset/web-hd"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details