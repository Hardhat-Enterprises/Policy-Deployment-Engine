package terraform.gcp.security.customer_engagement_suite.google_ces_agent.guardrails

import data.terraform.helpers
import data.terraform.gcp.security.customer_engagement_suite.google_ces_agent.vars

conditions := [
    [
        {
            "situation_description": "Customer Engagement Suite agents should not use unapproved guardrails.",
            "remedies": [
                "Remove the unapproved guardrail from the agent configuration."
            ]
        },
        {
            "condition": "Guardrails must not use unapproved guardrail resources.",
            "attribute_path": ["guardrails"],
            "values": [
                "unapproved-guardrail"
            ],
            "policy_type": "element blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
