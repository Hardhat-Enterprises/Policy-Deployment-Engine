package terraform.gcp.security.chronicle.google_chronicle_rule_deployment.enabled

import data.terraform.helpers
import data.terraform.gcp.security.chronicle.google_chronicle_rule_deployment.vars

conditions := [
    [
        {
            "situation_description": "Ensure the rule is deployed and enabled correctly.",
            "remedies": [
                "Set 'enabled' to true to activate the rule",
                "Check if 'enabled' is mistakenly set to false in the configuration"
            ]
        },
        {
            "condition": "Test if rule deployment is enabled",
            "attribute_path": ["enabled"],
            "values": [true],
            "policy_type": "whitelist" 
        }
    ]
]

# General message summarizing policy compliance
result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

# Detailed summary for debugging
details := result.details
