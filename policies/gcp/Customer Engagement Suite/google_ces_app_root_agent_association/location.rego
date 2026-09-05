package terraform.gcp.security.customer_engagement_suite.google_ces_app_root_agent_association.location

import data.terraform.helpers
import data.terraform.gcp.security.customer_engagement_suite.google_ces_app_root_agent_association.vars

conditions := [
    [
        {
            "situation_description": "App root agent associations must be deployed in an approved region.",
            "remedies": [
                "Deploy the resource in an approved region."
            ]
        },
        {
            "condition": "Location must be in the approved region list.",
            "attribute_path": [
                "location"
            ],
            "values": [
                "australia-southeast1",
                "australia-southeast2"
            ],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details