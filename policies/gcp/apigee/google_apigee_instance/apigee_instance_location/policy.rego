package terraform.gcp.security.apigee.google_apigee_instance.apigee_instance_location

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_instance.vars

conditions := [
    [
        {
            "situation_description": "Apigee Instance is not deployed in an approved Australian location",
            "remedies": [
                "Change the location to an approved Australian region",
                "Approved regions are: australia-southeast1, australia-southeast2"
            ]
        },
        {
            "condition": "Check if instance location is in the approved Australian whitelist",
            "attribute_path": ["location"],
            "values": ["australia-southeast1", "australia-southeast2"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details