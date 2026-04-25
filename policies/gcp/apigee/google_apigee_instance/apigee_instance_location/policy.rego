package terraform.gcp.security.apigee.google_apigee_instance.apigee_instance_location

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_instance.vars

conditions := [
    [
        {
            "situation_description": "Apigee Instance is not deployed in an approved location",
            "remedies": [
                "Change the location to an approved region",
                "Approved regions are defined in the whitelist"
            ]
        },
        {
            "condition": "Check if instance location is in the approved whitelist",
            "attribute_path": ["location"],
            "values": ["us-central1", "europe-west1", "asia-east1"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details