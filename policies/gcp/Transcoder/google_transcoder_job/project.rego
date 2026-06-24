package terraform.gcp.security.transcoder.google_transcoder_job.project

import data.terraform.helpers
import data.terraform.gcp.security.transcoder.google_transcoder_job.vars

conditions := [
    [
        {
            "situation_description": "Transcoder job is created in an unapproved Google Cloud project.",
            "remedies": [
                "Set the transcoder job project to 'my-project-name'.",
                "Create transcoder jobs only in approved and managed Google Cloud projects."
            ]
        },
        {
            "condition": "Transcoder job project must be my-project-name",
            "attribute_path": ["project"],
            "values": ["my-project-name"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
