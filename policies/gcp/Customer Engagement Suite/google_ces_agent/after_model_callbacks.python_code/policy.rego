package terraform.gcp.security.customer_engagement_suite.google_ces_agent.after_model_callbacks_python_code

import data.terraform.helpers
import data.terraform.gcp.security.customer_engagement_suite.google_ces_agent.vars

conditions := [
    [
        {
            "situation_description": "After-model callback code must not contain security findings at or above MEDIUM severity",
            "remedies": ["Remove or fix the insecure Python code in the callback"]
        },
        {
            "condition": "No security findings at/above MEDIUM",
            "attribute_path": ["after_model_callbacks", 0, "python_code"],
            "values": ["MEDIUM"],
            "policy_type": "content security"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
