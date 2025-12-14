package terraform.gcp.security.apigee.google_apigee_addons_config.organization_name

import data.terraform.gcp.helpers
import data.terraform.gcp.security.apigee.google_apigee_addons_config.vars

conditions := [
    [
        {
            "situation_description": "Organization name must start with 'PDE-'",
            "remedies": [
                "Update the org field so it begins with 'PDE-'"
            ]
        },
        {
            "condition": "Ensures that the Apigee organization name follows PDE-* naming convention",

            # Correct nested attribute path
            "attribute_path": ["org"],

            # Allow only org names that match this pattern
            "values": ["PDE-*"],

            "policy_type": "pattern whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
