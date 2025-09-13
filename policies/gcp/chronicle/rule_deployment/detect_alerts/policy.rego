package terraform.gcp.security.chronicle.rule_deployment.detect_alerts

import data.terraform.gcp.helpers
import data.terraform.gcp.security.chronicle.rule_deployment.vars

conditions := [
    [
        {"situation_description": "Alerting is not enabled on the Chronicle rule deployment.",
         "remedies": [
             "Set 'alerting = true' to ensure detections from this deployment are treated as alerts.",
             "Update the rule deployment configuration to include: alerting = true"
         ]
        },
        {
            "condition": "Check if alerting is enabled for the rule deployment",
            "attribute_path": ["alerting"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

# Message output when policy is evaluated
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed condition evaluation output
details := helpers.get_multi_summary(conditions, vars.variables).details
