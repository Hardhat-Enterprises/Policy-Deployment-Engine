package terraform.gcp.security.transcoder.google_transcoder_job_template.labels

import data.terraform.helpers
import data.terraform.gcp.security.transcoder.google_transcoder_job_template.vars

conditions := [
    [
        {
            "situation_description": "Transcoder job template is missing the required environment label.",
            "remedies": [
                "Add the label 'environment' with the approved value 'dev'.",
                "Use environment labels to support auditing, ownership tracking, incident response, and dev/test/prod separation."
            ]
        },
        {
            "condition": "Transcoder job template labels.environment must be dev",
            "attribute_path": ["labels", "environment"],
            "values": ["dev"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details