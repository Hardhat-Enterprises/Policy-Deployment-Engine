package terraform.gcp.security.analytics_hub.listing.region_restriction

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analytics_hub.listing.vars

conditions := [
    [
        {
            "situation_description": "c2: Listing must only be deployed in approved Australian regions",
            "remedies":[ 
                "Ensure listing region is australia-southeast1 or australia-southeast2",
                "Update the Terraform configuration to use an approved region"
            ]
        },
        {
            "condition": "Check if listing region is approved",
            "attribute_path": ["location"], 
            "values": ["australia-southeast1", "australia-southeast2"], 
            "policy_type": "pattern whitelist"
        }
    ]
]

# General compliance summary
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed compliance evaluation
details := helpers.get_multi_summary(conditions, vars.variables).details
