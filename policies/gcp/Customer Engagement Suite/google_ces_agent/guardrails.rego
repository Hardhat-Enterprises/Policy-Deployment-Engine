package terraform.gcp.security.customer_engagement_suite.google_ces_agent.guardrails

import data.terraform.helpers
import data.terraform.gcp.security.customer_engagement_suite.google_ces_agent.vars

conditions := [
    [
        {
            "situation_description": "Customer Engagement Suite agents should use approved guardrails.",
            "remedies": [
                "Configure the agent with an approved guardrail."
            ]
        },
        {
            "condition": "Guardrails must reference approved guardrail resources.",
            "attribute_path": ["guardrails",0],
            "values": [
                "projects/example-project/locations/australia-southeast1/apps/example-app/guardrails/*",
                [
                    ["approved-guardrail", "approved-guardrail_1"]
                ]
            ],
            "policy_type": "pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details