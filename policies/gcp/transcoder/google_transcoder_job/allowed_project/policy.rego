package terraform.gcp.security.transcoder.google_transcoder_job.allowed_project

import data.terraform.helpers
import data.terraform.gcp.security.transcoder.google_transcoder_job.vars

conditions := [
    [
        {
            "situation_description": "The transcoder job project is not in the allowed list.",
            "remedies": [
                "Use an approved project such as 'my-project-name'.",
                "Avoid creating transcoder jobs in unapproved projects."
            ]
        },
        {
            "condition": "Check if project is not in the allowed whitelist",
            "attribute_path": ["project"],
            "values": ["my-project-name"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details