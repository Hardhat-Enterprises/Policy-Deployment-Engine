package terraform.gcp.security.chronicle.rule_deployment.rule_deployment_enabled

import data.terraform.gcp.helpers
import data.terraform.gcp.security.chronicle.rule_deployment.vars

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
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed summary for debugging
details := helpers.get_multi_summary(conditions, vars.variables).details
