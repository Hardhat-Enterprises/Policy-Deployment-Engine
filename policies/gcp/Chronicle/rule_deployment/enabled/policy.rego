package terraform.gcp.security.Chronicle.rule_deployment.enabled

import data.terraform.gcp.helpers
import data.terraform.gcp.security.Chronicle.rule_deployment.vars

# Conditions array to hold scenarios
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
            "policy_type": "whitelist"  # 'enabled' should be true to ensure the rule is active
        }
    ],
    [
        {
            "situation_description": "Rule should not be disabled if it's needed for production.",
            "remedies": [
                "Ensure 'enabled' is not set to false when the rule is required for monitoring",
                "If not needed, consider archiving the rule instead of disabling it"
            ]
        },
        {
            "condition": "Test if rule deployment is disabled",
            "attribute_path": ["enabled"],
            "values": [false],
            "policy_type": "blacklist"  # 'enabled' should not be false unless explicitly archived
        }
    ]
]

# General message summarizing policy compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed summary for debugging
details := helpers.get_multi_summary(conditions, vars.variables).details
