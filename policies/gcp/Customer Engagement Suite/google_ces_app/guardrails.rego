package terraform.gcp.security.customer_engagement_suite.google_ces_app.guardrails

import data.terraform.helpers
import data.terraform.gcp.security.customer_engagement_suite.google_ces_app.vars

conditions := [
    [
        {
            "situation_description": "CES app must define a guardrail to constrain agent behaviour.",
            "remedies": ["Define at least one guardrail for the CES app."]
        },
        {
            "condition": "guardrails must not be empty",
            "attribute_path": ["guardrails"],
            "values": [null, []],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details