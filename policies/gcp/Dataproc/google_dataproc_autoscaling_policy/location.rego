package terraform.gcp.security.dataproc.google_dataproc_autoscaling_policy.location

import data.terraform.helpers
import data.terraform.gcp.security.dataproc.google_dataproc_autoscaling_policy.vars

conditions := [
    [
        {
            "situation_description": "Dataproc Autoscaling Policy is deployed outside an approved region.",
            "remedies": [
                "Deploy the autoscaling policy in an approved region."
            ]
        },
        {
            "condition": "Location must be one of the approved regions.",
            "attribute_path": ["location"],
            "values": [
                "australia-southeast1",
                "us-central1",
                "us-east1"
            ],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details