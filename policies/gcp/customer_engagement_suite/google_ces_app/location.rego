package terraform.gcp.security.customer_engagement_suite.google_ces_app.location

import data.terraform.helpers
import data.terraform.gcp.security.customer_engagement_suite.google_ces_app.vars

conditions := [[
        {
            "situation_description": "Ensure Google CES App is deployed in an approved location",
            "remedies": ["Set location to an approved region"]
        },
        {
            "condition": "Validating location",
            "attribute_path": ["location"],
            "values": ["australia-southeast1"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details