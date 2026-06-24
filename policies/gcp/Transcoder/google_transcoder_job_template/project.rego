package terraform.gcp.security.transcoder.google_transcoder_job_template.project

import data.terraform.helpers
import data.terraform.gcp.security.transcoder.google_transcoder_job_template.vars

conditions := [
    [
        {
            "situation_description": "Transcoder job template is created in an unapproved Google Cloud project.",
            "remedies": [
                "Set the transcoder job template project to 'my-project-name'.",
                "Create transcoder job templates only in approved and managed Google Cloud projects."
            ]
        },
        {
            "condition": "Transcoder job template project must be my-project-name",
            "attribute_path": ["project"],
            "values": ["my-project-name"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
