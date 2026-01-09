package terraform.gcp.security.apigee.google_apigee_addons_config.organization_name

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_addons_config.vars

conditions := [
    [
        {
            "situation_description": "Organization name must start with 'PDE-Project1'",
            "remedies": [
                "Update the org field so it begins with 'PDE-Project1'"
            ]
        },
        {
            "condition": "Ensures that the Apigee organization name follows PDE-Project1 naming convention",

            # Correct nested attribute path
            "attribute_path": ["org"],

            # Allow only org names that match this pattern
            "values": ["PDE-Project1"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
