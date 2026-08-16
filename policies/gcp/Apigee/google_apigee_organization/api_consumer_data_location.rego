package terraform.gcp.security.apigee.google_apigee_organization.api_consumer_data_location

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_organization.vars

conditions := [
    [
        {
            "situation_description": "Apigee Organization api_consumer_data_location is not set to an approved Australian region which may violate data residency and compliance requirements",
            "remedies": [
                "Set api_consumer_data_location to an approved Australian region",
                "Approved regions are: australia-southeast1, australia-southeast2"
            ]
        },
        {
            "condition": "Check if api_consumer_data_location is in the approved Australian whitelist",
            "attribute_path": ["api_consumer_data_location"],
            "values": ["australia-southeast1", "australia-southeast2"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details