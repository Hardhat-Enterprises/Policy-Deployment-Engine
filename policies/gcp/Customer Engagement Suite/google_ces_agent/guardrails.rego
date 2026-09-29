package terraform.gcp.security.customer_engagement_suite.google_ces_agent.guardrails

import data.terraform.helpers
import data.terraform.gcp.security.customer_engagement_suite.google_ces_agent.vars

conditions := [
    [
        {
           "situation_description": "Customer Engagement Suite agents must reference guardrails using the approved platform resource path shape.",


            "remedies": [
                "Reference a concrete guardrail resource name: projects/{project}/locations/{location}/apps/{app}/guardrails/{guardrail}."
            ]
        },
        {
            "condition": "Guardrails must match the platform resource path shape.",
            "attribute_path": ["guardrails"],
            "values": [
                "projects/*/locations/*/apps/*/guardrails/*"
            ],
            "policy_type": "element pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
