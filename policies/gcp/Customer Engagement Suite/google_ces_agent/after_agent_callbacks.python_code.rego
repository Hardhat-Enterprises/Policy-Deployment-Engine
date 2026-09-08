package terraform.gcp.security.customer_engagement_suite.google_ces_agent.after_agent_callbacks_python_code

import data.terraform.helpers
import data.terraform.gcp.security.customer_engagement_suite.google_ces_agent.vars

conditions := [
    [
        {
            "situation_description": "Agent callback code must not contain security findings at or above MEDIUM severity",
            "remedies": ["Remove or fix the insecure Python code in the callback"]
        },
        {
            "condition": "No security findings at/above MEDIUM",
            "attribute_path": ["after_agent_callbacks", 0, "python_code"],
            "values": ["MEDIUM"],
            "policy_type": "content security"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
