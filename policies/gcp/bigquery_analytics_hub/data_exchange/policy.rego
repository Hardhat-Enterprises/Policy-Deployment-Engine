package terraform.gcp.security.analytics_hub.data_exchange.policy

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analytics_hub.data_exchange.vars

conditions := [
    [
        {
            "situation_description": "c1: Data Exchange must be deployed in an approved Australian region",
            "remedies": [
                "Select australia-southeast1 or australia-southeast2 as the region",
                "Update the Terraform configuration to use an approved region"
            ]
        },
        {
            "condition": "Check if location is within approved Australian regions",
            "attribute_path": ["location"],
            "values": [
                "australia-southeast1",
                "australia-southeast2"
            ],
            "policy_type": "pattern whitelist"
        }
    ]
]

# Displays a general message about policy compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resource’s compliance to every condition
details := helpers.get_multi_summary(conditions, vars.variables).details
