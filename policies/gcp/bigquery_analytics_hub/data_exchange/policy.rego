package terraform.gcp.security.analytics_hub.data_exchange.policy

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analytics_hub.data_exchange.vars

conditions := [
    [
        {
            "situation_description": "Data Exchange must be deployed in an approved region",
            "remedies": [
                "Select a region within australia-southeast1 or australia-southeast2",
                "Update your Terraform resource to use an allowed region"
            ]
        },
        {
            "condition": "Check if location is within allowed Australian regions",
            "attribute_path": ["location"],
            "values": ["australia-southeast1", "australia-southeast2"],
            "policy_type": "pattern whitelist"
        }
    ],
    [
        {
            "situation_description": "Data Exchange description should not be left empty",
            "remedies": [
                "Provide a meaningful description when creating the Data Exchange"
            ]
        },
        {
            "condition": "Check if description is provided",
            "attribute_path": ["description"],
            "values": [".+"],        # regex ensures non-empty string
            "policy_type": "regex whitelist"
        }
    ]
]

# Displays a general message about policy compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resource’s compliance to every condition
details := helpers.get_multi_summary(conditions, vars.variables).details
