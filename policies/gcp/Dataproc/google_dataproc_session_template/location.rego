package terraform.gcp.security.dataproc.google_dataproc_session_template.location

import data.terraform.gcp.security.dataproc.google_dataproc_session_template.vars
import data.terraform.helpers

conditions := [
    [
        {
            "situation_description": "Dataproc Session Template is deployed outside an approved region.",
            "remedies": [
                "Deploy the Dataproc Session Template in an approved region.",
            ]
        },
        {
            "condition": "Location must be one of the approved regions.",
            "attribute_path": ["location"],
            "values": [
                "australia-southeast1",
                "us-central1",
                "us-east1",
            ],
            "policy_type": "whitelist",
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
