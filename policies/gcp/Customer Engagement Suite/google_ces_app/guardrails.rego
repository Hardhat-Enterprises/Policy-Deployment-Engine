package terraform.gcp.security.customer_engagement_suite.google_ces_app.guardrails

import data.terraform.helpers
import data.terraform.gcp.security.customer_engagement_suite.google_ces_app.vars

conditions := [
    [
        {
            "situation_description": "CES app does not define an approved guardrail.",
            "remedies": ["Configure an approved guardrail for the CES app."]
        },
        {
            "condition": "Guardrails must use an approved value.",
            "attribute_path": ["guardrails"],
            "values": ["approved-guardrail"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details